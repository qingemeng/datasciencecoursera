install.packages("ggplot2")
library(ggplot2)
library(datasets)
data(airquality)
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

### q9

g <- ggplot(movies, aes(votes, rating))
print(g)

### q10
#qplot(votes, rating, data = movies)
qplot(votes, rating, data = movies) + geom_smooth()
