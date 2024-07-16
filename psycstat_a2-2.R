# intelligence

# population
pop_mean = 100
pop_sd = 10

# sample
sample_size = 18
num_samples = 1000

# sample means
sample_means <- replicate(num_samples, mean(rnorm(sample_size, mean = pop_mean, sd = pop_sd))) 

# sample mean and std
mean_of_sample_means = mean(sample_means)
sd_of_sample_means = sd(sample_means)

# PDF
min_range = mean_of_sample_means - 3 * sd_of_sample_means
max_range = mean_of_sample_means + 3 * sd_of_sample_means

x = seq(min_range, max_range, length = 1000)
normpdf = dnorm(x, mean = mean_of_sample_means, sd = sd_of_sample_means)

# plot
plot(x, normpdf, 
     type="l", lty=1, lwd=2, col="dark blue", bty="n",
     main='Cumulative Distribution Function of N(3, 9)', 
     xlab="", ylab="cumulative density", 
     xlim = c(min_range, max_range), axes = FALSE)

# axis
axis(side = 1, at = seq(min_range, max_range, by = sd_of_sample_means))
axis(side = 2, at = seq(0, 0.15, by = 0.05))

# grid
grid(nx = 2, ny = NA)

cat("mean:", mean_of_sample_means)
cat("std:", sd_of_sample_means)

# estimation
mean = pop_mean
sd = pop_sd / sqrt(sample_size)

cat("mean:", mean)
cat("std:", sd)

# pdf
x2 = seq(mean - 3 * sd, mean + 3 * sd, length = 1000)
normpdf2 = dnorm(x2, mean = mean, sd = sd)

# plot
plot(x2, normpdf2, 
     type="l", lty=1, lwd=2, col="dark blue", bty="n",
     main='PDF of sample size 18', 
     xlab="", ylab="density", 
     xlim = c(mean - 3 * sd, mean + 3 * sd), axes = FALSE)

# axis
axis(side = 1, at = seq(mean - 3 * sd, mean + 3 * sd, by = sd))
axis(side = 2, at = seq(0, 0.15, by = 0.05))

# grid
grid(nx = 2, ny = NA)

