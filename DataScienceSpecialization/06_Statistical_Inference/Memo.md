
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


### The Law of Large Numbers (LLN) 大数の法則

### 標準誤差 (Standard Error)
集団からある数の標本を選ぶとき、選ぶ組み合わせに依って統計量がどの程度ばらつくかを、全ての組み合わせについての標準偏差で表したもの
標準偏差σ、要素数Nの母集団からn個の標本を抽出するとき、標準誤差
Nが十分大きい場合には : σ/sqrt(n)

### 信頼区間 Confidence interval (CI)
分布が正規分布に従う場合、95%信頼区間は、約平均±2×標準誤差となる。 

### 信頼水準（英: confidence level）または信頼係数（英: confidence coefficient）

例えば「信頼水準95%で、投票者の35%から45%がA候補を支持している」といったとき、95%というのが信頼水準で、35%から45%というのが信頼区間、g(θ) に当たるのはA候補の支持率である。 

### 独立同分布, 独立同一分布
独立同分布（independent and identically distributed; IID, iid）や独立同一分布とは、確率論と統計学において、確率変数の列やその他の系が、それぞれの確率変数が他の確率変数と同じ確率分布を持ち、かつ、それぞれ互いに独立している場合をいう

### 中心極限定理 The Central Limit Theorem (CLT) 



### Common distribution

#### ベルヌーイ分布
https://ja.wikipedia.org/wiki/%E3%83%99%E3%83%AB%E3%83%8C%E3%83%BC%E3%82%A4%E5%88%86%E5%B8%83

- 確率変数(事象)={0,1}、1の事象が確率「p」で発生する
- 確率質量関数: f(k;p) = p^k ( 1−p )^(1−k) for  k∈{0,1}  (kは確率変数)
- 期待値: p
- 分散: p(1−p)

#### 二項分布
https://ja.wikipedia.org/wiki/%E4%BA%8C%E9%A0%85%E5%88%86%E5%B8%83
結果が成功か失敗のいずれかである試行（ベルヌーイ試行）を独立に n 回行ったときの成功回数を確率変数とする離散確率分布
- 確率質量関数: P[X=k] = choose(n,k) * p^k * (1-p)^(n-k)  for k=0,1,2,...,n <br/>
choose(n,k) = nCk = n!/(k!*(n-k)!), n=試行回数、x=成功回数 <br/>
試行回数がnであるときに、x回成功する確率
- 累積分布(cdf)
pbinom(q, size=n, prob=p, lower.tail=F), <br/>
q=確率点(quantile|qtukey), lower.tail=F 上側確率(確率変数が確率(分位)点より大きい確率lower.tail=F)
pbinom(q=2,size=5,prob=0.8,lower.tail=F)
- 期待値 np
- 分散 σ^2 np(1-p)

#### 正規分布(ガウス分布)、 the normal distribution, Gaussian 
- 平均　μ, mean, mu
- 分散　σ^2
- 標準偏差 σ <br/>
平均値から1、2、3標準偏差以内 = 約68％、95％、および99％
- 確率点 qnorm(q, mean, sd) <br/>
qnorm(0.1) 10パーセンタイルの位置 x
- 累積分布 
pnorm(q, mean, sd, lower.tail=F)

The bounds of the interval
範囲 = p + c(-1,1) * qnorm(片側信頼水準) * sqrt(p*(1-p)/n)
片側信頼水準 = 0.975

binom.test: ベルヌーイ実験における成功確率についての単純な帰無仮説の厳密検定を実行
binom.test(60,100)$conf.int  ## 100 の内, 60が成功すると予測する場合、
 [1] 0.4972 0.6967
 attr(,"conf.level")
 [1] 0.95 ## 信頼水準


#### ポアソン, Poisson

- 累積分布(cdf)
ppos(q, mean, lower.tail=T, log.p=F), <br/>
ppos(3,2.5*4):単位時間あたり2.5のポアソンであり、4単位時間に3以下(最大3)が到着する確率

原子力ポンプが94.32日のうち5回故障したとし、1日あたりの故障率に対して95％の信頼区間が欲しいとします。
x=回数, t=期間
推定平均(estimated mean, lambda) = x/t = 5/94.32
推定分散(estimated variance) lamb/t
95％信頼区間を計算 est mean + c(-1,1)* qnorm(.975)* sqrt(est var)

poisson.test(x,t)$conf

