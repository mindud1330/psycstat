import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

# 평균과 표준편차
mu = 3
sigma = 3  # 표준편차의 제곱은 분산입니다.

# x값 범위
x = np.linspace(mu - 4*sigma, mu + 4*sigma, 100)

# 누적 분포 함수 계산
y = norm.cdf(x, mu, sigma)

# 그래프 그리기
plt.plot(x, y)
plt.title('Cumulative Distribution Function of N(3, 9)')
plt.xlabel('x')
plt.ylabel('Cumulative Probability')
plt.grid(True)

# x축과 y축의 눈금 설정
plt.xticks(np.arange(mu - 4*sigma, mu + 4*sigma + 1, 1))  # x축의 눈금 설정
plt.yticks(np.arange(0, 1.1, 0.1))  # y축의 눈금 설정
plt.ylim(bottom=0, top=1)

plt.show()

# 99백분위
quantile_99 = norm.ppf(0.99, loc=mu, scale=sigma)

print("99백분위:", quantile_99)