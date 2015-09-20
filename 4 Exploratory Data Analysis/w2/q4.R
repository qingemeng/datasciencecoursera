library(lattice)
library(datasets)
data(airquality)
xyplot(Ozone ~ Wind | factor(Month), data = airquality)
