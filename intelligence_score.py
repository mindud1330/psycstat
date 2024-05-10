import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

# 평균과 표준편차
mean = 100
std_dev = 10

# 크기가 18인 표본을 1000회 추출
sample_size = 18
num_samples = 1000
sample_means = []

# 표본평균
for _ in range(num_samples):
    sample = np.random.normal(mean, std_dev, sample_size)
    sample_mean = np.mean(sample)
    sample_means.append(sample_mean)

# 표본평균들의 평균과 표준편차 계산
mean_of_sample_means = np.mean(sample_means)
std_dev_of_sample_means = np.std(sample_means)

print("average:", mean_of_sample_means)
print("standard", std_dev_of_sample_means)

# pdf 
x = np.array(sample_means)
x = sorted(x)
y = norm.pdf(x, mean_of_sample_means, std_dev_of_sample_means)

# 그래프 그리기
plt.plot(x, y)
plt.title('Probability Density Function of Sample Means')
plt.xlabel('Sample Mean')
plt.ylabel('Probability Density')
plt.grid(True)
plt.ylim(bottom=0)
plt.show()