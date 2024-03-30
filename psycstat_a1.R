## psyctat assignment1

# install.packages(dplyr) # install package
library(dplyr)

getwd()

# read original data
fname = "./psycstat_data_2024.csv"
df = read.csv(file=fname, header=TRUE, sep=",")
head(df)

# reverse data: Per5, 9, 10, 15
df$Per5_r = 6 - df$Per5
df$Per9_r = 6 - df$Per9
df$Per10_r = 6 - df$Per10
df$Per15_r = 6 - df$Per15

## check reversing 
table(df$Per5, exclude = NULL)
table(df$Per5_r, exclude = NULL)
table(df$Per9, exclude = NULL)
table(df$Per9_r, exclude = NULL)
table(df$Per10, exclude = NULL)
table(df$Per10_r, exclude = NULL)
table(df$Per15, exclude = NULL)
table(df$Per15_r, exclude = NULL)

# Extraversion 
## subseting
ext_cols = c("Per1", "Per9_r", "Per14")
df_ext = subset(df, select = ext_cols)
head(df_ext)

## sum of the extraversian values
df$Exts = apply(df_ext, MARGIN = 1, FUN = sum, na.rm = TRUE)

## statistics value
ext_avg = mean(df$Exts, na.rm=TRUE) # average
ext_var = var(df$Exts, na.rm=TRUE) # variance
ext_sd = sd(df$Exts, na.rm=TRUE) # standard deviation
ext_med = median(df$Exts, na.rm=TRUE) # median

## visualization
hist(df$Exts)

# Agreeableness
## subseting
agr_cols = c("Per4", "Per12", "Per15_r")
df_agr = subset(df, select = agr_cols)
head(df_agr)

## sum of the areeableness values
df$Agrs = apply(df_agr, MARGIN = 1, FUN = sum, na.rm = TRUE)

## statistics value
agr_avg = mean(df$Agrs, na.rm=TRUE) # average
agr_var = var(df$Agrs, na.rm=TRUE) # variance
agr_sd = sd(df$Agrs, na.rm=TRUE) # standard deviation
agr_med = median(df$Agrs, na.rm=TRUE) # median

## visualization
hist(df$Agrs)

# Conscientiousness
## subseting
con_cols = c("Per2", "Per6", "Per13")
df_con = subset(df, select = con_cols)
head(df_con)

## sum of the conscientiousness values
df$Cons = apply(df_con, MARGIN = 1, FUN = sum, na.rm = TRUE)

## statistics value
con_avg = mean(df$Cons, na.rm=TRUE) # average
con_var = var(df$Cons, na.rm=TRUE) # variance
con_sd = sd(df$Cons, na.rm=TRUE) # standard deviation
con_med = median(df$Cons, na.rm=TRUE) # median

## visualization
hist(df$Cons)

# Neuroticism
## subseting
neu_cols = c("Per5_r", "Per7", "Per10_r")
df_neu = subset(df, select = neu_cols)
head(df_neu)

## sum of the conscientiousness values
df$Neus = apply(df_neu, MARGIN = 1, FUN = sum, na.rm = TRUE)

# save data copy 
fname_copy = "./psycstat_data_2024_copy.csv"
write.csv(df, file = fname_copy, row.names = TRUE)

## random sampling 
# sample_data = df_neu[sample(nrow(df_neu), size = 10, replace = TRUE), ]
sample_data = sample(df$Neus, size = 10, replace = TRUE)
sample_data
cat(sample_data, sep = ",")

## statistics value
sample_neu_avg = mean(sample_data, na.rm=TRUE) # average
sample_neu_var = var(sample_data, na.rm=TRUE) # variance
sample_neu_sd = sd(sample_data, na.rm=TRUE) # standard deviation
sample_neu_med = median(sample_data, na.rm=TRUE) # median

## visualization
hist(df$Neus)
hist(sample_data)

