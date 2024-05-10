import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import t

# 자유도
df = 22

# x값 범위
x = np.linspace(t.ppf(0.001, df), t.ppf(0.999, df), 100)

# 확률 밀도 함수 계산
y = t.pdf(x, df)

# 그래프 그리기
plt.plot(x, y, 'r-', label='t df=22')
plt.title('t-Distribution (df=22)')
plt.xlabel('x')
plt.ylabel('Probability Density')
plt.legend()
plt.grid(True)
plt.show()

# P(|t| > 3.2)
probability = 1 - t.cdf(3.2, df=df) + t.cdf(-3.2, df=df)

print("P(|t| > 3.2) =", probability)