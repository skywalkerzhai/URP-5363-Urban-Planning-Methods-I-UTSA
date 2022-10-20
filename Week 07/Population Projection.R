
x <- c(2010,2011,2012,2013,2014,2015,2016,2017,2018,2019) #year
y <- c(100, 121, 144, 170, 150, 160, 170, 178, 189, 193) #thousand persons

#create a scatterplot of x vs. y
plot(x, y, pch=19, xlab='x', ylab='y')

#fit a linear model
poly.lm1 <- lm(y ~ poly(x, 1))
poly.lm2 <- lm(y ~ poly(x, 2))
poly.lm3 <- lm(y ~ poly(x, 3))


# To predict y for new x-values, make a data.frame: 
new.x <- c(2020, 2021, 2022, 2023, 2024)
new.df <- data.frame(x=new.x)

new.y <- predict(poly.lm1, newdata=new.df)
new.y <- predict(poly.lm2, newdata=new.df)
new.y <- predict(poly.lm3, newdata=new.df)


#add curve of each model to plot
x_axis <- seq(2010, 2019, length=10)
lines(x_axis, predict(poly.lm1, data.frame(x=x_axis)), col='green')
lines(x_axis, predict(poly.lm2, data.frame(x=x_axis)), col='red')
lines(x_axis, predict(poly.lm3, data.frame(x=x_axis)), col='purple')
