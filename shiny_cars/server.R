library(shiny)
library(ggplot2)
data(mtcars)
mycars<- mtcars
mycars$am <- as.factor(ifelse(mtcars$am == 0, "automatic", "manual"))

p0 <- qplot(y=mpg, x=hp, col=am, data=mycars) +
        stat_smooth(method=lm, formula=y~x)

fit_wt_hp <- lm(mpg ~ am + wt + hp, data = mycars)
coef_fit = coef(fit_wt_hp)
i_aut = coef_fit[1] +mean(mycars$wt)*coef_fit[3] 
i_man = coef_fit[1] + coef_fit[2] + mean(mycars$wt)*coef_fit[3]
p1 <- qplot(hp, mpg, col = am, data = mycars) + 
      geom_abline(intercept=i_aut, slope = coef_fit[4], col = I("red") ) +
      geom_abline(intercept=i_man, slope = coef_fit[4], col = I("green") )
#p1

fit_wt = lm(wt ~ am + hp, data = mycars)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$mpgPlot <- renderPlot({
   
  #input$HP
  user_am <- as.factor(
                ifelse(input$ami==T, 
                          'manual',
                          'automatic'))
  user_wt <- predict(fit_wt, newdata = data.frame(hp=input$HP, am=user_am))
  user_data = data.frame(hp = input$HP, 
                        am = user_am,
                        wt = user_wt
  )
  user_mpg = predict(fit_wt_hp, newdata = user_data)
  user_point = data.frame(hp = input$HP,
                          am = user_am,
                          wt = user_wt,
                          mpg = user_mpg)
    #draw mpg plot
	p0 + geom_point (data = user_point, col=I('black'), size = 10, shape=I(4))
    
  })
  
  output$results <- renderTable({
    user_am <- as.factor(
                ifelse(input$ami==T, 
                       'manual',
                       'automatic'))
    user_wt <- predict(fit_wt, newdata = data.frame(hp=input$HP, am=user_am))
    user_data = data.frame(hp = input$HP, 
                           am = user_am,
                           wt = user_wt
    )
  })
})
