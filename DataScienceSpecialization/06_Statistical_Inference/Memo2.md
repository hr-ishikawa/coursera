## (例) 2つのグループ間の平均に有意差があるかどうか
平均の差を表わす統計量は「t値」

### t分布 (t distribution)
自由度(degrees of freedom (df))

qt(0.975, df=2) # 自由度2 

### T検定 (T test)

##### 一標本片側検定 (標本の平均がある値以上or以下であることの検定)
t.test(g2, mu=mu, alternative="greater", conf.level=0.95)  
%% 対立仮説(H1): mean(g2)>=mu (alternative="greater")  

##### 一標本両側検定 (標本の平均がある値であることの検定)
t.test(g2, mu=mu, alternative="two.sided", conf.level=0.95)  
%% 仮説(H0): mean(g2)==mu (alternative="two.sided")  
%% 平均が同じである仮説を棄却できるorできない

##### 二標本片側検定 (二標本の一方の平均が他方以上or以下であることの検定)
t.test(g2, g1, paired=FALSE, var.equal=FALSE, alternative="greater", conf.level=0.95)  
%% ペアでない (paired=FALSE)  
%% 分散は一致していない (var.equal=FALSE)  
%% 帰無仮説(H0): g2==g1  
%% 対立仮説(H1): g2>=g1 (alternative="greater")  
%% 信頼度(1-有意水準)：95% (conf.level=0.95)  
%% 有意水準(α): p < αの時にH_{0}を棄却  

set.seed(0)  
g1 <- rnorm(10,10,3)  
g2 <- rnorm(12,15,4)  
boxplot(g1,g2)  
t.test(g2, g1, paired=FALSE, var.equal=FALSE, alternative="greater", conf.level=0.95)  
%% 	Welch Two Sample t-test                      ## <== Method  
%%  
%% data:  g2 and g1  
%% t = 2.0221, df = 15.999, p-value = 0.03011    ## <== t値、df:自由度、p値が0.05(5%)以下なので帰無仮説が棄却  
%% alternative hypothesis: true difference in means is greater than 0  ## 対立仮説が支持された  
%% 95 percent confidence interval:               ## <== 信頼度95%(有意水準5%)での信頼区間  
%%  0.3777683       Inf  
%% sample estimates:  
%% mean of x mean of y   
%%  13.84277  11.07677  
names(out1)
%% [1] "statistic"   "parameter"   "p.value"     "conf.int"    "estimate"   
%% [6] "null.value"  "alternative" "method"      "data.name"  

t.test(sample, mu=100, alternative="less")

t.test(g2, g1, paired=FALSE,var.equal=TRUE, alternative="less")


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

H_0 : mu=30, sd=4, n=16
H_a : mu>30,
t <- (X'-30)/(s/sqrt(n))


### Normal Distribution
z <- qnorm(.95,sd=1) # [1] 1.644854
pnorm(30+z,32,sd=1,lower.tail=FALSE) # [1] 0.63876


power.t.test(n=16, delta=2/4, sd=1, type="one.sample", alt="one.sided")$power # [1] 0.6040329
solve for the sample size n
power.t.test(power=0.8, delta= 2/4, sd=1, type="one.sample", alt="one.sided")$n # [1] 26.13751
find delta
power.t.test(power=0.8, n=26, sd=1, type="one.sample", alt="one.sided")$delta # [1] 0.5013986



### http://www.mus-nh.city.osaka.jp/iso/argo/nl11/nl11-3-16.pdf

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



例  
捕食性巻貝A種の、フジツボB種に対する捕食圧を、  
対応2資料t検定で分析するケースを取り上げる。  
実験区コントロール区を隣り合わせに4ペア設置  
実験区のみに同数のA種を導入する。  
4組内での実験区とコントロール区のB種の密度差（実験区における減少量）は  
30個体／㎡（標準偏差SD=20）であった。  

帰無仮説H0：A種の存在はB種の密度を減少させない  
実験は小標本であるからt検定  
片側検定  

t=(m－μ)/s×√n（m,標本平均；μ,母集団平均；s,標本分散；n,標本数）  
t=(30－0)/20×√4 = 3.0  
qt(0.95,3)  ## [1] 2.353363  < 3.0  
自由度=3、t=2.35以上になる確率が0.05であるから、mはP<0.05の棄却域  
 ==> 「危険率5％で（ないし有意水準95％で）H0(密度を減少させない)は棄却された」  
 ==> 「A種のB種に対する捕食圧」は「無いとは言えない」==>   
 「存在するらしい」

この時の「5％」がTypeIエラー（α=0.05）==> 偽陽性リスク  


### TypeII error（第2種の過誤）とStatistical power（検出力）

例  
X型: 平均14.0mm(SD,3.0mm)、
Y型: 平均17.0mm(SD,3.0mm)
共に正規分布
標本平均: 15.0mm(SD,3.0mm)、標本数9　はどちらに属するか

1) X型　H0：サンプルはX型に属する
H0の分布に注目して、片側検定(一方向の差異)のTypeIエラー検定  
t=(15.0－14.0)/3×√9=1.0、t分布表で、自由度9－1=8におけるP=0.19(pt(t,df=8)=0.)  
危険率α=0.05のもとで、標本集団とX型母集団との差は有意ではない  
(0.19 > 0.05)  

2) Y型  対立仮説Ha：サンプルはY型に属する  
t=(17.0－14.0)/3×√9=2.0、自由度８におけるP=0.04(pt(t,df=8)=0.040)となり、  
Y型平均値との差は有意（片側検定）。  
(0.04 < 0.05)  

この時のP=0.04がTypeIIエラーβ、1－β=1－0.04=0.96が、検出力と呼ばれるものである。  

#### TypeI error（α、危険率）
実際にはH0が正しいにもかかわらず、それを誤りと判定する確率。差がないのにあると判断してしまう危険の率。
#### 有意水準
Significance level (1－α=0.95)  

#### TypeII error（β）
実際にはHaが正しいにもかかわらず、それを誤りとみなす確率。  
#### 検出力
tatistical power (ないし単にpower、1－β)  

HAが正しいときに、それを棄却せずにすます確率。これをH0の側から見ると、H0＝notHAにより、H0が誤っているとき、それを正しく認める確率となる。差の存在を正しく検出する力、と考えてよいだろう。別の見方をすると、検出力が大きいということは、TypeIIエラーβが小さいことである。βは上に述べたように「H0を正しいと認めたとき、それが誤っている確率」であるから、βが小さいということは「差なし」と判定したときの信頼度が高いことになる。つまり、「差なし」とか「同じ」と言うためには、検出力が十分高くなければならない。そしてこれが、実用上最も重要な検出力の意味である。検出力を計算することを、poweranalysis（検出力分析）と呼ぶ。


### Multiple Testing

A Type I error is rejecting a true hypothesis -> convicting an innocent person  
Type I error: 仮説の正しさの棄却　-> 無実(仮説)の人を有罪(棄却)とすること  

A Type II error is failing to reject a false hypothesis -> acquitting a guilty person  
A Type II error: 対立仮説の棄却に失敗する -> 有罪(対立仮説)の人を無罪(棄却に失敗)とすること  

The null hypothes is represents the status_quo and is assumed true

The p-value is "the probability under the null hypothesis of obtaining evidence as or more extreme than your test statistic (obtained from your observed data) in the direction of the alternative hypothesis."   

method="bonferroni" to control the FWER.
sum(p.adjust(pValues,method="bonferroni") < 0.05)   # [1] 0
So the correction eliminated all the false positives that had passed the uncorrected alpha test. 
修正されていないアルファテストに合格したすべての誤検知が排除されました。

the method "BH" to control the FDR.
sum(p.adjust(pValues,method="BH") < 0.05)  # [1] 0
BH法ではすべての誤検知も排除されました。


> table(pValues2<.05,trueStatus)
       trueStatus
        not zero zero
  FALSE        0  476
  TRUE       500   24

> table(p.adjust(pValues2,method="bonferroni")<0.05,trueStatus)
       trueStatus
        not zero zero
  FALSE       23  500
  TRUE       477    0

> table(p.adjust(pValues2,method="BH")<0.05,trueStatus)
       trueStatus
        not zero zero
  FALSE        0  487
  TRUE       500   13


### Resampling
### Bootstrapping
```
median(resampledMedians) ## [1] 68.61582

median(fh) ## [1] 67.7666
B <- 1000
sam <- sample(fh,nh*B,replace=TRUE)
resam <- matrix(sam,B,nh) 
meds <- apply(resam,1,median)
median(meds) ## [1] 67.7666
median(meds)-median(fh) ## [1] 0
sd(meds) ## [1] 0.1059033
sd(resampledMedians) ## [1] 0.08493945
quantile(resampledMedians,c(.025,.975))
##     2.5%    97.5% 
## 68.43713 68.81649 
quantile(meds,c(.025,.975))
##     2.5%    97.5% 
## 67.54033 67.94425 

dim(InsectSprays) ## [1] 72  2

```
### 順列検定 (permutation testing)
As bootstrapping did, permutation testing samples a single dataset a zillion times and calculates a statistic based on these samplings.

```
head(InsectSprays)
#  count spray
#1    10     A
#2     7     A
#3    20     A

range(Bdata$count) ## [1]  7 21
range(Cdata$count) ## [1] 0 7
Cdata$count ## [1] 0 1 7 2 3 1 2 1 3 0 1 4
Bdata$count ## [1] 11 17 21 11 16 14 17 17 19 21  7 13
```
H_0: B,C 平均が等しい
```
BCcounts ##  [1] 11 17 21 11 16 14 17 17 19 21  7 13  0  1  7  2  3  1  2  1  3  0  1  4
group    ## [1] "B" "B" "B" "B" "B" "B" "B" "B" "B" "B" "B" "B" "C" "C" "C" "C" "C" "C" "C" "C" "C" "C" "C" "C"
testStat
## function(w, g) mean(w[g == "B"]) - mean(w[g == "C"])
obs <- testStat(BCcounts,group) ## [1] 13.25
mean(Bdata$count-Cdata$count) ## [1] 13.25

perms <- sapply(1 : 10000, function(i) testStat(BCcounts, sample(group)))
mean(perms>obs) ## [1] 0

```
0 < 13.25  
Here's a histogram of the difference of the means. Looks pretty normal, right? We can see that the distribution runs roughly between -10 and +10 and it's centered around 0. The vertical line shows where the observed difference of means was and we see that it's pretty far away from the distribution of the resampled permutations. This means that group identification did matter and sprays B and C were quite different.


### QUIZ 4

#### Q1
A pharmaceutical company is interested in testing a potential blood pressure lowering medication. Their first examination considers only subjects that received the medication at baseline then two weeks later. The data are as follows (SBP in mmHg)  
Consider testing the hypothesis that there was a mean reduction in blood pressure? Give the P-value for the associated two sided T test. (Hint, consider that the observations are paired.)

製薬会社は、潜在的な血圧降下薬のテストに興味を持っています。 彼らの最初の検査では、ベースラインで薬を服用し、2週間後に服用した被験者のみを考慮します。 データは次のとおりです（mmBP単位のSBP）
血圧の平均低下があったという仮説の検証を検討してください。 関連する両側T検定のP値を与えます。 （ヒント、観測がペアになっていることを考慮してください。）
```
g1 <-c(140,138,150,148,135)
g2 <-c(132,135,151,146,130)

t.test(g1)
## 
##         One Sample t-test
## 
## data:  g1
## t = 48.947, df = 4, p-value = 1.042e-06
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  134.134 150.266
## sample estimates:
## mean of x 
##     142.2 

t.test(g2)
## 
##         One Sample t-test
## 
## data:  g2
## t = 33.724, df = 4, p-value = 4.612e-06
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  127.3726 150.2274
## sample estimates:
## mean of x 
##     138.8 

t.test(g2-g1, alternative="two.sided")
## 
##         One Sample t-test
## 
## data:  g2 - g1
## t = -2.2616, df = 4, p-value = 0.08652
## alternative hypothesis: true mean is not equal to 0
## 95 percent confidence interval:
##  -7.5739122  0.7739122
## sample estimates:
## mean of x 
##      -3.4 

bl <- c(140, 138, 150, 148, 135)
fu <- c(132, 135, 151, 146, 130)
t.test(fu, bl, alternative = "two.sided", paired = TRUE)
## Paired t-test
## data: fu and bl
## t = -2.262, df = 4, p-value = 0.08652
## alternative hypothesis: true difference in means is not equal to 0
## 95 percent confidence interval:
## -7.5739 0.7739
## sample estimates:
## mean of the differences
## -3.4

-t.test(fu, bl, alternative = "less", paired = TRUE)
## Paired t-test
## data: fu and bl
## t = -2.262, df = 4, p-value = 0.04326
## alternative hypothesis: true difference in means is less than 0
## 95 percent confidence interval:-Inf -0.1951
## sample estimates:
## mean of the differences
## -3.4
```
#### Q2
A sample of 9 men yielded a sample average brain volume of 1,100cc and a standard deviation of 30cc. 
What is the complete set of values of μ 0 that a test of H_0:μ=μ 0 would fail to reject the null hypothesis in a two sided 5% Students t-test?
```
1100 + c(-1, 1) * qt(0.975, 8) * 30/sqrt(9) [1] 1077 1123
```
#### Q3
Researchers conducted a blind taste test of Coke versus Pepsi. Each of four people was asked which of two blinded drinks given in random order that they preferred. The data was such that 3 of the 4 people chose Coke. Assuming that this sample is representative, report a P-value for a test of the hypothesis that Coke is preferred to Pepsi using a one sided exact test.
```
pbinom(2, size = 4, prob = 0.5, lower.tail = FALSE)  ## [1] 0.3125
choose(4, 3) * 0.5^4 + choose(4, 4) * 0.5^4  ## [1] 0.3125
```
#### Q4
Infection rates at a hospital above 1 infection per 100 person days at risk are believed to be too high and are used as a benchmark. 
A hospital that had previously been above the benchmark recently had 10 infections over the last 1,787 person days at risk. About what is the one sided P-value for the relevant test of whether the hospital is *below* the standard?
```
ppois(10, lambda = 0.01 * 1787)  ## ## [1] 0.03237
```
#### Q5
```
```
#### Q6
Brain volumes for 9 men yielded a 90% confidence interval of 1,077 cc to 1,123 cc. Would you reject in a two sided 5% hypothesis test of 
H_0 : μ=1,078?

No you wouldn't reject.  
No, you would fail to reject. The 95% interval would be wider than the 90% interval. Since 1,078 is in the narrower 90% interval, it would also be in the wider 95% interval. Thus, in either case it's in the interval and so you would fail to reject.
#### Q7
Researchers would like to conduct a study of 100 healthy adults to detect a four year mean brain volume loss of .01mm^3. Assume that the standard deviation of four year volume loss in this population is .04mm^3. About what would be the power of the study for a 5% one sided test versus a null hypothesis of no volume loss?
```
pnorm(1.645 * 0.004, mean = 0.01, sd = 0.004, lower.tail = FALSE)  ## [1] 0.8037

power.t.test(n=100, delta=0.01, sd=0.04, type="one.sample", alt="one.sided")$power  ## [1] 0.7989855
```
#### Q8
Researchers would like to conduct a study of n n healthy adults to detect a four year mean brain volume loss of .01mm^3. Assume that the standard deviation of four year volume loss in this population is .04mm^3. About what would be the value of n needed for 90% power of type one error rate of 5% one sided test versus a null hypothesis of no volume loss?
```
ceiling((4 * (qnorm(0.95) - qnorm(0.1)))^2)  ## [1] 138

power.t.test(power=0.9, delta=0.01, sd=0.04, type="one.sample", alt="one.sided")$n  ## [1] 138.3856
```
#### Q9
As you increase the type one error rate, \alpha α, what happens to power?  
You will get larger power.  
As you require less evidence to reject, i.e. your \alpha α rate goes up, you will have larger power.
