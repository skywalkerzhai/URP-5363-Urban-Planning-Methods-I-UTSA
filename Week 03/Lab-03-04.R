# Installation
install.packages('ggplot2')
# Loading
library(ggplot2)
# Load the data
data(mtcars)
df <- mtcars[, c("mpg", "cyl", "wt")] #mpg:miles per gallon; cyl: cylinder; wt: weight
# Convert cyl to a factor variable

df$cyl <- as.factor(df$cyl)

head(df)

#The qplot() function is very similar to the standard R plot() function. 
#can be used to create quickly and easily different types of graphs:
#scatter plots, box plots, histogram and density plots.

qplot(x = mpg, y = wt, data = df, geom = "point") # mpg: "miles per gallon"

#The following R code will change the color and the shape of points by groups. 
#The column cyl will be used as grouping variable. In other words, the color 
#and the shape of points will be changed by the levels of cyl.

qplot(mpg, wt, data = df, colour = cyl, shape = cyl)

#Box plot, violin plot and dot plot
#The R code below generates some data containing the weights by gender (M for male; F for female):
set.seed(1234)

wdata = data.frame(
  sex = factor(rep(c("F", "M"), each=200)),
  weight = c(rnorm(200, 55), rnorm(200, 58)))
head(wdata)

# Basic box plot from data frame
qplot(sex, weight, data = wdata, 
      geom= "boxplot", fill = sex)

# Histogram  plot
# Change histogram fill color by group (sex)

female=wdata[wdata$sex=='F',]

qplot(weight, data = female, geom = "histogram",
      fill = sex)
qplot(weight, data = female, geom = "density",
      color = sex, linetype = sex)


qplot(weight, data = wdata, geom = "histogram",
      fill = sex)

# Density plot
# Change density plot line color by group (sex)
# change line type
qplot(weight, data = wdata, geom = "density",
      color = sex, linetype = sex)



# ggplot ------------------------------------------------------------------

# Basic scatter plot
ggplot(data = mtcars, aes(x = wt, y = mpg)) + 
  geom_point()

# Change the point size, and shape
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(size = 2, shape = 23)

#The function aes_string() can be used as follow:
ggplot(mtcars, aes_string(x = "wt", y = "mpg")) +
  geom_point(size = 2, shape = 23)


#In the following example, the function geom_density() 
# Use geometry function
ggplot(wdata, aes(x = weight)) + geom_density()



install.packages('plyr')
library(plyr)
mu <- ddply(wdata, "sex", summarise, grp.mean=mean(weight))
head(mu)

a <- ggplot(wdata, aes(x = weight))


'''
geom_density(): Create a smooth density estimate
We’ll use the following functions:

geom_density() to create a density plot
geom_vline() to add a vertical lines corresponding to group mean values
scale_color_manual() to change the color manually by groups
'''

# Basic plot
a + geom_density()
# change line colors by sex
a + geom_density(aes(color = sex)) 
# Change fill color by sex
# Use semi-transparent fill: alpha = 0.4
a + geom_density(aes(fill = sex), alpha=0.4)

# Add mean line and Change color manually
a + geom_density(aes(color = sex)) +
  geom_vline(data=mu, aes(xintercept=grp.mean, color=sex),
             linetype="dashed") +
  scale_color_manual(values=c("#999999", "#E69F00"))


#geom_freqpoly(): Frequency polygon
# Basic plot
a + geom_freqpoly() 
# change y axis to density value
# and change theme
a + geom_freqpoly(aes(y = ..density..)) +
  theme_minimal()
# change color and linetype by sex
a + geom_freqpoly(aes(color = sex, linetype = sex)) +
  theme_minimal()

#geom_histogram(): Histogram
# Basic plot
a + geom_histogram()

# change line colors by sex
a + geom_histogram(aes(color = sex), fill = "white",
                   position = "dodge") 

a + geom_histogram(aes(y = ..density..))

#stat_ecdf(): Empirical Cumulative Density Function
a + stat_ecdf()

#stat_qq(): quantile - quantile plot
ggplot(mtcars, aes(sample=mpg)) + stat_qq()


'''
One variable: Discrete
The function geom_bar() can be used to visualize one discrete 
variable. In this case, the count of each level is plotted. We’ll use 
the mpg data set [in ggplot2 package]. The R code is as follow:
'''

data(mpg)
b <- ggplot(mpg, aes(fl))
# Basic plot
b + geom_bar()
# Change fill color
b + geom_bar(fill = "steelblue", color ="steelblue") +
  theme_minimal()

b + stat_count()


'''
Two variables: Continuous X, Continuous Y
We’ll use the mtcars data set. The variable cyl is used as grouping variable.
'''
data(mtcars)
mtcars$cyl <- as.factor(mtcars$cyl)
head(mtcars[, c("wt", "mpg", "cyl")])

b <- ggplot(mtcars, aes(x = wt, y = mpg))


# Basic plot
b + geom_point()

# change the color and the point 
# by the levels of cyl variable
b + geom_point(aes(color = cyl, shape = cyl)) 
# Change color manually
b + geom_point(aes(color = cyl, shape = cyl)) +
  scale_color_manual(values = c("#999999", "#E69F00", "#56B4E9"))+
  theme_minimal()

