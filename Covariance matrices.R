# Building a Covariance matrix in R - two ways

#Create column vectors
a <- c(1,2,3,4,5,6)
b <- c(1,3,5,7,9,11)
c <- c(10,20,30,40,50,60)
d <- c(4,5,6,7,8,9)
e <- c(2,5,5,2,1,9)

# Create a matrix from vectors
M <- cbind(a, b, c, d, e)
k <- ncol(M)
n <- nrow(M)
print(M)

# Find the mean for each column
k_mean <- matrix(data = 1, nrow = n) %*% cbind(mean(a), mean(b), mean(c), mean(d), mean(e))
print(k_mean)

# Alternative way, step by step
k1 <- matrix(data = 1, nrow = n)
print(k1)
k2 <- cbind(mean(a), mean(b), mean(c), mean(d), mean(e))
print(k2)
k_mean1 <- k1 %*% k2
print(k_mean1)
# dumb check
proof1 <- k_mean - k_mean1
print(proof1)

# Create a difference matrix
diffM <- M - k_mean
print(diffM)
print(t(diffM)) # t() transpose matrix

# Create the covariance matrix ---> SAMPLE WISE COVARIANCE (not POPULATION COVARIANCE!)
covarM <- (n-1)^(-1) * t(diffM) %*% diffM  #correct
print(covarM)                              #correct
covarM1 <- (n-1)^(-1) * diffM %*% t(diffM) #WRONG!
print(covarM1)                             #WRONG!

# Covariance using R built-in function cov()
print(cov(M))

# Find variances from the covariance matrix: VARIANCES are on the DIAGONAL of covariance matrix
variance <- diag(covarM)
print(variance)




