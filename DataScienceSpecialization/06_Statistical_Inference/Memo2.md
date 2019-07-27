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
(X'-mu) / SE = 2 > 1.645  ## 95%の値を超えている

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





