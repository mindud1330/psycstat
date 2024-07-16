## psyctat assignment3

library(psych)
library(car)

# read original data
fname = "./psycstat_data_2024.csv"
df = read.csv(file=fname, header=TRUE, sep=",")
head(df)

# reverse data: Per5, 9, 10, 15
df$Per5_r = 6 - df$Per5
df$Per10_r = 6 - df$Per10

# Neuroticism
## subseting
neu_cols = c("Per5_r", "Per7", "Per10_r")
df_neu = subset(df, select = neu_cols)
head(df_neu)

## mean of the neuroticism values
df$Neus = apply(df_neu, MARGIN = 1, FUN = mean, na.rm = TRUE)

# Sex - Male: 1, Female: 0
print("여=0, 남=1")
mean_by_sex = tapply(df$Neus, df$sex, mean, na.rm = TRUE)
var_by_sex = tapply(df$Neus, df$sex, var, na.rm = TRUE)

print(mean_by_sex)
print(var_by_sex)

# levene's test 
lev_test = leveneTest(Neus ~ as.factor(sex), data = df) 
print("Levene\'s test:")
print(lev_test)

# F-test
f_test = var.test(Neus ~ as.factor(sex), data = df)
print("F-test:")
print(f_test)

# t-test
t_test = t.test(df$Neus ~ as.factor(df$sex), var.equal=TRUE, conf.level=.95) 
print("t-test:")
print(t_test)

t_test_f = t.test(df$Neus ~ as.factor(df$sex), var.equal=FALSE, conf.level=.95) 
print("t-test (false):")
print(t_test_f)
