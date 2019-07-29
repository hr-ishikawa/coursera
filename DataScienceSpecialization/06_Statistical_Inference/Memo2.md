## (例) 2つのグループ間の平均に有意差があるかどうか
平均の差を表わす統計量は「t値」

### t分布 (t distribution)
自由度(degrees of freedom (df))

qt(0.975, df=2) # 自由度2 

### t信頼区間 (t confidence intervals)

### 信頼区間(confidence interval)
信頼係数=95%の信頼区間 = 標本集団の95% が含まれる値の範囲[quantile(0.025,0.975)] = 平均 ± 1.96σ

平均値 +/- 95%分位値 * 標準誤差(?)

標準偏差σ

Est +/- qnorm * std error(Est)

Est +/- t-quantile *std error(Est)


### 母平均の「信頼区間」
標本平均 ± t値 × 標本標準偏差 ÷ √標本の数



#### Z統計値 (Z statistic)

Z=(X'-mu)/(sigma/sqrt(n)) which follows a standard normal distribution

#### t統計値 (t statistic)

t=(X'-mu)/(s/sqrt(n))  s: 標本標準偏差(the sample standard deviation)

(X' - mu)/(s/sqrt(n)) has n-1 degrees of freedom

X' +/- t_(n-1) * s/sqrt(n)

### t信頼区間
#### ペアの場合
difference <- g2-g1

n <- length(g1) = length(g2)

s  <- sd(difference)

mn <- mean(difference)

mn + c(-1,1)*qt(.975,n-1)*s/sqrt(n)

mn + c(-1,1)*qt(.975,9)*s/sqrt(10) # (サンプル数10)

qt(分位数, 自由度)                # t分布(自由度で分布が決定される)の分位

qt(0.975, df=2)                  # 自由度2のt分布で95%分位の値

t.test(difference)$conf.int 　# t検定関数

n_x, n_y  2 groups 

t_(.975,n_x+n_y-2)

((n_x-1)(S_x)^2+(n_y-1)(S_y)^2) / ((n_x-1)+(n_y-1))

### 2 Groups
Gr1: n_x= 8, mn_x=132.86, S_x=15.34

Gr2: n_y=21, mn_y=127.44, S_y=18.23

sp <- (n_x-1)(S_x)^2 +(n_y-1)(S_y)^2

ns <- n_x+n_y-2

sp <- sqrt(sp/ns)

mn_x-mn_y +c(-1,1) * qt(0.975,ns) * sp*sqrt(1/n_x + 1/n_y)

the sample pooled variance

sp <- sqrt( ((length(g1)-1)*var(g1)+(length(g2)-1)*var(g1)) / (length(g1)+length(g2)-2) )

mean(g2)-mean(g1) + c(-1,1) * qt(.975,(length(g1)+length(g2)-2)) * sp*sqrt(1/length(g1)+1/length(g2))

t.test(g2, g1, paired=FALSE,var.equal=TRUE)$conf    # ペアでない場合信頼区間

t.test(g2, g1, paired=TRUE)$conf                    # ペアの場合信頼区間


#### 2 Groups
Gr1: n_x= 8, mn_x=132.86, S_x=15.34

Gr2: n_y=21, mn_y=127.44, S_y=18.23



### 帰無仮説 NULL hypothesis (H_0)
### 対立仮説 alternative hypotheses (H_a)

Sample;
    母集団RDI:  mu=30/h, 分散varianse=1
    標本RDI:    X'=32/h, n=100, sd=10/h
  Test 
    H_0(mu=30)
    H_a: mu>30
    
    H_a is TRUE and we accept it
    H_0 is TRUE and we reject it

    Type I  error REJECTS a TRUE  null hypothesis H_0
    Type II error ACCEPTS a FALSE null hypothesis H_0


### 第一種過誤（α過誤、偽陽性）
帰無仮説が実際には真であるのに棄却してしまう過誤である。つまり、偽がヒットすることによるエラーである。
### 第二種過誤（β過誤、偽陰性）
対立仮説が実際には真であるのに帰無仮説を採用してしまう過誤である。つまり、真が抜け落ちることによるエラーである。 対立仮説が正しい時に対立仮説を採択しない誤りのこと。 


standard error  
SE = sd / sqrt(n) = 10/sqrt(100)

mu + qnorm(0.95) * SE = 31.645 < 3.2
 => 95%の外側(片側5%)に含まれる
 => H_0が棄却される？

Z値
(X'-mu) / SE = 2 > 1.645  \## 95%の値を超えている

The general rule for rejection is if sqrt(n) * ( X' - mu) / s > Z_{1-alpha}.

標本RDI:    X'=32/h, n=16, sd=10/h
検定統計量(the value of the test statistic)
  (X'-mu)/(s/sqrt(n)) = (32-30)/(10/sqrt(16)) = 0.8
  qt(0.95,15) = 1.75 # 自由度15の95%分位値
  0.8 < 1.75  ## 95%以下なので棄却できない

father-son hight
> head(fs)
   fheight  sheight
1 65.04851 59.77827
2 63.25094 63.21404

> dim(fs)
[1] 1078    2

t.test(fs$sheight-fs$fheight)             # 差の平均値が0か
t.test(fs$sheight,fs$fheight,paired=TRUE) # 平均値の差が0か

        Paired t-test

data:  fs$sheight and fs$fheight
t = 11.789, df = 1077, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 0.8310296 1.1629160               ### <= 信頼区間
sample estimates:
mean of the differences 
              0.9969728 

t統計量 = 11.789
H_0: 差の真の平均が0であった

t統計量 * sd(g1-g2)/sqrt(n)
11.7885 * sd(fs$sheight-fs$fheight)/sqrt(1078) = 0.9969686



### 
Create a null hypothesis
Calculate a test statistic from the given data
Compare the test statistic to the hypothetical distribution

#### Sample;
df = 15,
帰無H_0: t mu = mu_0、
代替H_a: mu   > mu_0

t分布のmu が2.5以上の確率
pt(2.5, df=15, lower.tail=F) # [1] 0.0122529  < 0.05

H_0は棄却(Reject)


正規分布のH_0に対して、
検定統計量2を超える確率
pnorm(2,lower.tail=FALSE)  \## [1] 0.02275013 < 0.05
有意水準0.05とすれば棄却されるが、
有意水準0.01とすれば棄却されない

H_0を棄却するかどうかの代わりに、有意水準(アルファレベル)ではなくp値を報告することで、
作品のレビュー担当者は自分が選択した任意のアルファレベルで仮説検定を行うことができる。


### 両側検定 (two-sided test)

確率:0.5
試行数8、出力7

rev(pbinom(0:8,8,0.5))
\# [1] 1.00000000 0.99609375 0.96484375 0.85546875 0.63671875 0.36328125
\# [7] 0.14453125 0.03515625 0.00390625

6以上のの確率
pbinom(6,size=8,prob=.5,lower.tail=FALSE)  \## [1] 0.03515625 < 0.05 => Reject
pbinom(7,size=8,prob=.5,lower.tail=TRUE)   \## [1] 0.9960938 : 7以下の確率


### Poisson distribution
仮説:  
rate: 0.05

実測値:  
infection rate: 10 / 100 person/days = 0.1

H_0はλ= 0.05、ambda_0 * 100 = 5、  
H_aはλ> 0.05

10回以上の確率:  
ppois(9,5,lower.tail=FALSE)  ## [1] 0.03182806 < 0.05 => Reject


#--------------------------


①：帰無仮説（否定したい仮説）H0を決める
②：検定に使う統計量を選択し、有意水準を設定する
③：実際にデータを取り、統計量の実現値を計算する
④：仮説の下では今回の統計量の実現値が珍しい値なのかどうかを調べる（p値の算出）
⑤-1：帰無仮説の下で偶然得られたと考えてもおかしくない値だと分かった場合、帰無仮説は棄却されない（帰無仮説が正しくないとは断定できない＝何も言えない）
⑤-2：帰無仮説の下で偶然得られたとは考えにくいほど珍しい値だと分かった場合、帰無仮説を棄却する（帰無仮説が正しくないと判断する）

例：

帰無仮説：表が出る確率が0.5。
コインを10回投げて2回表が出た。この結果は帰無仮説を棄却できるか。

10回投げて表の確率が0.5とすると、
　両側検定
　仮説による平均値: X = 5

信頼区間: X +/- q() s * sqrt(n)

#=======================================--


n=9, mean=1100, sd=30

95%両側信頼区間
q=0.975
mean +/- qt(q,n-1)*sd/sqrt(n)

1100 + c(-1,1) * qt(0.975,8) * 30/sqrt(9) ## [1] 1076.94 1123.06


### Q4
g1: mean=5, sd1=0.68, n1=10
g2: mean=3, sd2=0.60, n2=10

sp <- sqrt( ((n1-1)*var(g1) + (n2-1)*var(g1)) / (n1+n2-2) )
   =  sqrt( ((n1-1)*sd1^2 + (n2-1)*sd2^2) / (n1+n2-2) )
mean2-mean1 + c(-1,1) * qt(.975,(n1+n2-2)) * sp*sqrt(1/n1+1/n2)

Sp <- sqrt(0.5*0.68+0.5*0.6)
3-5 + c(-1,1) * qt(.975,(18)) * Sp*sqrt(1/10+1/10) ## [1] 2.397508 3.602492

### Q6
g1: mean=4, sd1=0.50, n1=100
g2: mean=6, sd2=2.00, n2=100

Sp <- sqrt(0.5*0.5 + 0.5*2)
6-4 + c(-1,1) * qt(.975,(198)) * Sp*sqrt(1/100+1/100) ## [1] 2.397508 3.602492



### Q7

```
gr1: n1=9, mn1=-3, sd1=1.5
gr2: n2=9, mn2=+1, sd2=1.8

sp <- sqrt( ((n1-1)*var(g1) + (n2-1)*var(g1)) / (n1+n2-2) )
   =  sqrt( ((n1-1)*sd1^2 + (n2-1)*sd2^2) / (n1+n2-2) )
mn2-mn1 + c(-1,1) * qt(.975,(n1+n2-2)) * sp*sqrt(1/n1+1/n2)

sp <- sqrt( ((8)*1.5^2 + (8)*1.8^2) / (16) )
-3-1 + c(-1,1) * qt(.95,(16)) * sp*sqrt(1/9+1/9) ## [1] 2.397508 3.602492

n1 <- n2 <- 9
x1 <-  -3 ##treated
x2 <-   1 ##placebo
s1 <- 1.5 ##treated
s2 <- 1.8 ##placebo
s <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))
(x1 - x2) + c(-1, 1) * qt(0.95, n1 + n2 - 2) * s * sqrt(1/n1 + 1/n2)
```

### Power


帰無仮説（H0）(「差がない」ないし「同じである」)
  有意差が出れば、一定の危険率（α）のもとに「同じであるとはいえない」＝「差がある」と結論
         このときのαをTypeIerror（第１種の過誤）と呼ぶ。
  有意差が出なかった場合、その結果は単に「差があるとは言えない」ことを示す
         「差なし」と結論することはできない

「差なし」と言いたいのであれば、それは検出力（statisticalpowerないし単にpower）の問題
   十分な検出力を持った検定において初めて、「差なし」という結論が、
   一定の危険率（β）のもとに肯定される。
   このβが、今回テーマとするTypeIIerror（第２種の過誤）である。


|||検定|結果|
|---|---|---|---|
|         |               |H0採択(=差なし) |H0棄却(=差あり) |
|実際の状態| H0真(=差なし) | 正しい判定   |Type I Error     |
|         | H0偽(=差あり) |Type II Error |正しい判定        |



