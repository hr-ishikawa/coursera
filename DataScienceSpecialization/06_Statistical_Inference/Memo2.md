
### t分布 (t distribution)
自由度(degrees of freedom (df))

qt(0.975, df=2) # 自由度2 

### t信頼区間 (t confidence intervals)

### 信頼区間(confidence interval)
95%の信頼区間 = 標本集団の95% が含まれる値の範囲[quantile(0.025,0.975)] = 平均 ± 1.96σ

平均値 +/- 95%分位値 * 標準誤差(?)

標準偏差σ

Est +/- qnorm * std error(Est)

Est +/- t-quantile *std error(Est)


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



両側/片側検定


帰無仮説


