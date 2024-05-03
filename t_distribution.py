import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm, t

# x 값 범위 설정
x = np.linspace(-5, 5, 1000)

# t-분포의 확률 밀도 함수와 정규 분포의 확률 밀도 함수 계산
df = 5  # 자유도
t_pdf = t.pdf(x, df)
norm_pdf = norm.pdf(x, 0, 1)  # 평균이 0, 표준편차가 1인 정규 분포

# 그래프 그리기
plt.plot(x, t_pdf, label='t-distribution (df=5)')
plt.plot(x, norm_pdf, label='Normal distribution (mean=0, std=1)')
plt.xlabel('x')
plt.ylabel('Probability Density')
plt.title('t-Distribution vs Normal Distribution')
plt.legend()
plt.show()
