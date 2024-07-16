#CDF Normal N(3, 9)

# mean and std
mu = 3
sigma = 3

# range of x
x = seq(mu - 3 * sigma, mu + 3 * sigma, length = 100)

# cdf
normcdf_3_9 = pnorm(x, mean = mu, sd = sigma)

# plot
plot(x, normcdf_3_9, 
     type="l", lty=1, lwd=2, col="dark blue", bty="n",
     main='Cumulative Distribution Function of N(3, 9)', 
     xlab="", ylab="cumulative density", 
     xlim = c(-6, 12), ylim = c(0, 1), axes = FALSE)

# axis
axis(side = 1, at = seq(mu - 3*sigma, mu + 3*sigma, by = 1))
axis(side = 2, at = seq(0, 1, by = 0.1))

# grid
grid(nx = 2, ny = 2)

# 99quantile
quantile99 = qnorm(0.99, mean = 3, sd = sqrt(9))
print(quantile99)

# P(|t| > 3.2)
pt3p2 <- 1 - pt(3.2, df = 22) + pt(-3.2, df = 22)
print(pt3p2)
