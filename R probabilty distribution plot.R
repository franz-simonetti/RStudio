# Graphing Probabilty Density Functions in R
# Example 1: Plotting the normal distribution of people's IQ scores - mean 100 and StDev 15; what percentage of people has an IQ score greater than 115?

# Define distribution parameters
mean1 = 100
standev1 = 15
# Define lower and upper bounds of region of interest
# 115=1Sigma; 130=2Sigma; 145=3Sigma - see normal distribution properties at https://www.statisticshowto.com/probability-and-statistics/normal-distributions/
lower1 = 115
upper1 = Inf

# Generate sqeuence of numbers and make normal distribution
# dnorm gives the probabilty density  for the normal distribution with mean equal to mean and standard deviation equal to sd
# dnorm(x, mean = 0, sd = 1, log = FALSE)
# where # where x vector of quantiles, p vector of probabilities
x1 <- seq(-4, 4, length = 100) * standev1 + mean1
prob1 <- dnorm(x1, mean1, standev1)

# Make plot and add probability distribution and axes labels
plot(x1, prob1, type="n", xlab="IQ values", ylab ="P(x)", main = "Normal distribution of IQ scores", axes = FALSE)
lines(x1, prob1)
axis(1, at=seq(40, 160, 20), pos = 0)

# Generate a Polygon for region of interest
i <- x1 >= lower1 & x1 <= upper1
polygon( c(lower1,x1[i], upper1), c(0, prob1[i],0), col= "red")

# Calculate area under the curve for region of interest and show result
# pnorm gives the distribution function  for the normal distribution with mean equal to mean and standard deviation equal to sd
# pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# where q vector of quantiles, p vector of probabilities
area1 <- 1 - pnorm(lower1, mean1, standev1)
results1 <- paste("P(", lower1, "< IQ <", upper1, ") -", signif(area1, digits = 3))
mtext(results1,3)
