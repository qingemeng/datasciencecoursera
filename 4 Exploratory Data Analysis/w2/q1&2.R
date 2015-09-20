library(nlme)
library(lattice)
res <- xyplot(weight ~ Time | Diet, BodyWeight)
class(res)
