library(shiny)
#library(datasets)
library(zoo)
library(xts)
library(dygraphs)
library(shiny)
library(shinydashboard)

rnorm_fixed <- function(n,mu,sigma){
    x <- rnorm(n)
    x <- sigma * x /sd(x)
    x <- x - mean(x) + mu
    return(x)
}

dates <- seq(from=as.Date('2016-01-01'),to = as.Date('2016-12-31'),by='day')
df <- data.frame(date=dates,ratio=rnorm_fixed(366,80,15))
time <- as.POSIXct(paste(df$date,df$ratio),format = "%Y-%m-%d")
xt <- xts(x = df$ratio,order.by=time)


#dy<- dygraph(xt,main='TU ratio Showcase(Enterprise Architech)') %>% 
#    dyRangeSelector() %>% 
#    dySeries('V1',label='Ratio') %>%
#    dyLimit(73,color='red')%>%
#    dyLimit(88,color='blue')


shinyServer(function(input, output) {
    output$dygraph <- renderDygraph({
        dygraph(xt,main='TU ratio Showcase(Enterprise Architech)') %>% 
            dyRangeSelector() %>% 
            dySeries('V1',label='Ratio') %>%
            dyLimit(73,color='red')%>%
            dyLimit(88,color='blue')
    })
})