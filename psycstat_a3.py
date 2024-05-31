import numpy as np
import pandas as pd
from scipy import stats

# sex
MALE = 0
FEMALE = 1

# CSV file path
file_path = "psycstat_data_2024.csv"

# CSV file
df = pd.read_csv(file_path)

# inverse
df["Per5_inverse"] = 6 - df["Per5"]
df["Per9_inverse"] = 6 - df["Per9"]
df["Per10_inverse"] = 6 - df["Per10"]
df["Per15_inverse"] = 6 - df["Per15"]

# Extraversion
ext_cols = ["Per1", "Per9_inverse", "Per14"]
# Agreeableness
agr_cols = ["Per4", "Per12", "Per15_inverse"]
# Conscientiousness
con_cols = ["Per2", "Per6", "Per13"]
# Neuroticism
neu_cols = ["Per5_inverse", "Per7", "Per10_inverse"]

# mean data
df['Neu_mean'] = df[neu_cols].apply(lambda row: row.mean(skipna=True), axis=1)

# categorize by sex
male_neu = df[df['sex'] == MALE]['Neu_mean']
female_neu = df[df['sex'] == FEMALE]['Neu_mean']

# mean, var by sex 
avg_neu_sex = df.groupby('sex')['Neu_mean'].mean()
var_neu_sex = df.groupby('sex')['Neu_mean'].var()

print('\naverage by sex:\n', avg_neu_sex)
print('\nvariation by sex:\n', var_neu_sex)

# Levene's Test
levene_stat, levene_p = stats.levene(male_neu, female_neu)
print('\nLevene\'s Test')
print('levene value:', levene_stat)
print('p-value:', levene_p)

# F-test
F_stat, f_p = stats.f_oneway(male_neu, female_neu)
print('\nF-Test')
print('F-value:', F_stat)
print('p-value:', f_p)

# t-test
t_stat, t_p = stats.ttest_ind(male_neu, female_neu, equal_var=True)
print('\nt-Test')
print('t-value:', t_stat)
print('p-value:', t_p)

# confidence interval
confidence_level = 0.95
degrees_of_freedom = len(male_neu) + len(female_neu) - 2
t_critical = stats.t.ppf(confidence_level + (1 - confidence_level) / 2, degrees_of_freedom)
mean_difference = np.mean(male_neu) - np.mean(female_neu)
std_error = np.sqrt((male_neu.var() / len(male_neu) + female_neu.var() / len(female_neu)))

# 95% confidence interval
margin_of_error = t_critical * std_error
lower_bound = mean_difference - margin_of_error
upper_bound = mean_difference + margin_of_error

print("\n95% Confidence Interval")
print("Lower Bound:", lower_bound)
print("Upper Bound:", upper_bound)
