
### (離散型)確率変数
確率変数：起こりうる事象を表したもの

ex.: "1",...,"6" （＝さいころの出うる目）

### (離散型)確率分布
確率変数=X

P(X) = 1/6 (X=1,2,...,6) => Xが発生する確率

### 確率質量関数 (確率関数)
probability mass function, PMF

離散型確率変数Xがある値xをとる確率f(x):確率質量関数

f(x)=P(X=x)

### 期待値
確率変数のすべての値に確率の重みをつけた加重平均

expected value, expectation

X の期待値: E[X] = ∑ xi*P(X=xi)    

### 分散
variance

Var = E(X^2)-(E(X))^2


#### ベルヌーイ分布
https://ja.wikipedia.org/wiki/%E3%83%99%E3%83%AB%E3%83%8C%E3%83%BC%E3%82%A4%E5%88%86%E5%B8%83

- 確率変数(事象)={0,1}、1の事象が確率「p」で発生する
- 確率質量関数: f(k;p) = p^k ( 1−p )^(1−k) for  k∈{0,1}  (kは確率変数)
- 期待値: p
- 分散: p(1−p)

#### 二項分布
https://ja.wikipedia.org/wiki/%E4%BA%8C%E9%A0%85%E5%88%86%E5%B8%83

- 確率質量関数: P[X=k] = choose(n,k) * p^k * (1-p)^(n-k)  for k=0,1,2,...,n <br/>
choose(n,k) = nCk = n!/(k!*(n-k)!), n=試行回数、x=成功回数 <br/>
試行回数がnであるときに、x回成功する確率
- 累積分布(cdf)
pbinom(q, size=n, prob=p, lower.tail=F), <br/>
q=確率点(quantile|qtukey), lower.tail=F 上側確率(確率変数が確率(分位)点より大きい確率lower.tail=F)
pbinom(q=2,size=5,prob=0.8,lower.tail=F)

#### 正規分布(ガウス分布)、 the normal distribution, Gaussian 
- 平均　μ, mean, mu
- 分散　σ^2
- 標準偏差 σ <br/>
平均値から1、2、3標準偏差以内 = 約68％、95％、および99％
- 確率点 qnorm(q, mean, sd) <br/>
qnorm(0.1) 10パーセンタイルの位置 x
- 累積分布 
pnorm(q, mean, sd, lower.tail=F)

#### ポアソン, Poisson

- 累積分布(cdf)
ppos(q, mean, lower.tail=T, log.p=F), <br/>
ppos(3,2.5*4):単位時間あたり2.5のポアソンであり、4単位時間に3以下(最大3)が到着する確率


