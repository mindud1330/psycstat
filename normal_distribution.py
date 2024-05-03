import numpy as np
import matplotlib.pyplot as plt

# 표준 정규 분포 데이터 생성
data = np.random.randn(5000)

# 히스토그램 그리기
plt.hist(data, bins=30, density=True, 
         alpha=0.7, color='blue', edgecolor='black')

# 정규 분포 곡선 추가
mu, sigma = 0, 1  # 평균과 표준편차
x = np.linspace(mu - 3*sigma, mu + 3*sigma, 100)
plt.plot(x, 
         1/(sigma * np.sqrt(2 * np.pi)) * np.exp(-0.5 * ((x - mu) / sigma) ** 2), 
         color='red')

# 그래프 타이틀과 라벨 설정
plt.title('Standard Normal Distribution')
plt.xlabel('Value')
plt.ylabel('Probability Density')

# 그래프 표시
plt.show()
