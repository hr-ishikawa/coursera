## Regression Models Course Notes
Recuture Note http://sux13.github.io/DataScienceSpCourseNotes/7_REGMODS/Regression_Models_Course_Notes.html
Presentaion https://github.com/DataScienceSpecialization/courses/tree/master/07_RegressionModels/pdfs

## Model Selection

#### Example: Variance Inflation Factors
data(swiss)
fit  <- lm(Fertility ~ Agriculture, data=swiss)
fit2 <- lm(Fertility ~ Agriculture + Examination, data=swiss)
fit3 <- lm(Fertility ~ Agriculture + Examination + Education, data=swiss)
  calculate ratios of variances for Agriculture coef for fit2 and fit3 w.r.t fit1
c(summary(fit2)$cov.unscaled[2,2], summary(fit3)$cov.unscaled[2,2]) / a - 1
[1] 0.8915757 1.0891588

anova(fit1, fit3, fit5)
Analysis of Variance Table

Model 1: Fertility ~ Agriculture
Model 2: Fertility ~ Agriculture + Examination + Education
Model 3: Fertility ~ Agriculture + Examination + Education + Catholic + 
    Infant.Mortality
  Res.Df  RSS Df Sum of Sq    F  Pr(>F)    
1     45 6283                              
2     43 3181  2      3102 30.2 8.6e-09 ***
3     41 2105  2      1076 10.5 0.00021 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’

#### VIF (Variance Inflation Factors)
library(car)
mdl <- lm(Fertility ~ . , data = swiss)
vif(mdl) ## calculate the variance inflation factors
     Agriculture      Examination        Education         Catholic Infant.Mortality  
        2.284129         3.675420         2.774943         1.937160         1.107542  
他の変数との相関。　数値が大きいと他の変数と相関している割合が大きい。
ただし、除外すると、相関するリグレッサの係数推定値にバイアスがかかる場合がある。
因子分析や主成分分析などの方法で、回帰分析を同等の非相関セットに変換できるが、
変換されたリグレッサを使用すると、解釈が困難になる場合がある。

### 残差 (Residuals)
Yi = β0 + β*xi + εi  
ここで「誤差」 εi , i = 1, ... , n は統計的に独立 ですべて同じ分散 σ2 をもつ

「残差」：観測可能なデータに基く誤差の推定値

#### 分散分析：ANOVA


### influence, leverage

fit <- lm(y~x, data=df)
plot(fit, which=1)

fit %>% dfbase()               ## 各データ(行)に対して、そのデータを除いたものと含めたもの回帰を行い、切片と傾きの差を求める。


### influenceまたはleverage
- 両回帰モデルに対し、そのデータの各残差を求める。
- そのデータが影響のある場合、含めた場合の回帰線を自身に近づけるため、残差は小さくなる。
- 含めた時の残差と、含めない時の残差の比をとる。
- そのデータが影響力のある場合、差が
- 1 - (含めた残差)/(除いた残差)

df 
fit   <- lm(y ~ x, df)         ## 全体(データを含めた)の回帰  
fitno <- lm(y ~ x, df[-N,])    ## データ(N行目)を除いた回帰  
res   <- resid(fit)[N]         ## 含めた時の残差  
resno <- df[N,'y'] - predict(fitno, df[N,])  ## 除いた時の残差  
1 - res/resno                  ##   

#### hatvalues (leverage)
hatvalues(fit)                 ## 上記計算を実施  
influence(fit)$hat

sigma <- sqrt(deviance(fit)/df.residual(fit))
rstd <- resid(fit)/(sigma * sqrt(1-hatvalues(fit)))  ## 標準化残差 (standardized residual)

##### standardized residuals
rstandard(fit)                 ## 上記計算を実施  

### Scale-Locationプロット     ## fit値に対する標準化残差の平方根
plot(fit, which=3)             ## the square root of standardized residuals~fitted values

### Q-Qプロット                ## 標準偏差
plot(fit, which=2)

sigma1 <- sqrt(deviance(fitno)/df.residual(fitno))
fitnoの残差の標本標準偏差 <- 逸脱度を残差自由度で除算し、平方根をとる
sample standard deviation of fitno's residual <- 
 dividing its deviance by its residual degrees of freedom and taking the square root. 

the Studentized residual for the outlier sample

resid(fit)[N] / (sigma1 * sqrt(1-hatvalues(fit)[N]) )

#### studentized residuals
残差をその標準偏差の推定量で割って補正  
i 番のデータが「外れ値」かどうかを検討する時には、i番の観測を分散の推定には用いないことが望ましい。結局、以下の推定量が用いられる。

i番の観測を「除外」、「外部スチューデント化残差」 (externally studentized residual)  
              または「削除後スチューデント残差」 (deleted studentized residual)   
i番の観測を「含む」、「内部スチューデント化残差」 (internally studentized residual)   
誤差が独立で、期待値 0 で 分散 σ2 の 正規分布に従う場合、i 番の外部スチューデント化残差の確率分布はスチューデントのt分布となる。その自由度は n − m − 1 であり、値域は (-∞, +∞) である。  
???

rstudent(fit)                 ## 上記計算を実施  

#### Cook's distance 
dy <- predict(fitno, df) - predict(fit, df)  ## fitとfitnoの予測値の差
sum(dy^2)/(2*sigma^2)

cooks.distance(fit)           ## 上記計算を実施  



## GLM

共変量 covariate = 説明変数、独立変数、予測因子　連続な変数(質的に表される変数は要因と呼ばれる)。  
The alternative terms explanatory variable , independent variable , or predictor, are used in a regression analysis . In econometrics , the term “control variable” is usually used instead of “covariate”.  
代替用語の説明変数、独立変数、または予測変数は、回帰分析で使用されます。 計量経済学では、「共変量」の代わりに「制御変数」という用語が通常使用されます。  

### Binary GLM

バイナリGLMは、2つの値のみをとることができる結果をモデル化しようとすることに由来します。 いくつかの例には、研究の終了時の生存の有無、チームの勝利と敗北、治療または製品の成功と失敗が含まれます。 多くの場合、これらの結果は、有名な確率論者および数学者にちなんで名付けられたベルヌーイ分布から、ベルヌーイの結果と呼ばれます。

同じレベルの共変量値(covariate values)に対して複数の交換可能なバイナリ結果がある場合、それは二項データであり、0と1を1のカウントに集約できます。  
例として、害虫に4種類の農薬を散布し、それらが死んだかどうかを数える場合を想像してください。次に、各スプレーについて、スプレーされた死者数と総数でデータを要約し、ベルヌーイではなく二項分布としてデータを扱うことができます。
If we happen to have several exchangeable binary outcomes for the same level of covariate values, then that is binomial data and we can aggregate the 0’s and 1’s into the count of 1’s. 
As an example, imagine if we sprayed insect pests with 4 different pesticides and counted whether they died or not. Then for each spray, we could summarize the data with the count of dead and total number that were sprayed and treat the data as binomial rather than Bernoulli.



#### Odds

Odds = ρ/(1-ρ) 

