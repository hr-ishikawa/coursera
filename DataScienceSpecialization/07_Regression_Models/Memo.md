## Regression Models Course Notes
Recuture Note http://sux13.github.io/DataScienceSpCourseNotes/7_REGMODS/Regression_Models_Course_Notes.html
Presentaion https://github.com/DataScienceSpecialization/courses/tree/master/07_RegressionModels/pdfs

## Model Selection

### 共変量モデルの選択
- 自動化された共変量/予測子の選択は難しい
    - モデルの空間は、相互作用と多項式項で急速に爆発します
    - 注：Practical Machine Learningクラスでは、予測のために大きなモデル空間を移動するための多くの最新の方法がカバーされます
- 共変量の主成分分析（PCA）または因子分析モデルは、多くの場合、複雑な共変量空間の削減に役立ちます
    - 最も多くの変動を捕捉する変数の線形結合を見つける
- 優れた実験デザインにより、分析中に複雑なモデル検索の必要性を排除できます。
    - ランダム化、成層化は、単純に最終モデルを助けることができます
    - 残念ながら、設計の制御はしばしば制限されます
- データの理解に基づいて共変量空間を手動で探索することも実行可能です
    - 共変量調整と複数のモデルを使用して、モデルに特定の予測変数を追加する効果を調べます
    - 注：これはそれほど体系的または効率的なアプローチではありませんが、プロセスを通じてデータについて多くのことを教える傾向があります
- 対象のモデルがネストされている場合（つまり、1つのモデルが1つ以上の係数がゼロに設定された別のモデルの特別なケース）、それらを区別する多くのパラメーターがなければ、ネストされた尤度比テスト（ANOVA）を使用して見つけることができます最高のモデル
    - 一度に1つまたは2つのリグレッサを追加すると、分散分析（ANOVA）がうまく機能します
        - anova（fit1、fit2、fit3）=一連のネストされた線形回帰モデルのANOVAまたは分散分析（または逸脱）テーブルを実行します
    - 注：モデルの順序を正しくして、結果が適切であるようにすることが非常に重要です。
    - 例はここにあります
- 異なるモデルを検索する別の代替方法は、赤池情報量基準（AIC）が最小の最適なモデルを見つけるために、回帰変数を一度に1つずつ繰り返し追加/削除するステップワイズ検索アルゴリズムです。
    - step（lm、k = df）=与えられた線形モデルでステップワイズ回帰を実行して、最良の線形モデルを見つけて返します
        - k = log（n）=観測数の対数としてkの値を指定すると、ステップワイズ回帰モデルはAICの代わりにベイジアン情報量基準（BIC）を使用するように強制されます
        - 注：BICとAICの両方は、追加のペナルティ項を使用して回帰モデルにパラメーターを追加することを罰します。ペナルティはAICよりもBICの方が大きい
    - MASS :: stepAIC（lm、k = df）=ステップワイズ回帰のより汎用的で厳密な実装
    - 例はここにあります

#### Example: Variance Inflation Factors
data(swiss)
fit  <- lm(Fertility ~ Agriculture, data=swiss)
fit2 <- lm(Fertility ~ Agriculture + Examination, data=swiss)
fit3 <- lm(Fertility ~ Agriculture + Examination + Education, data=swiss)
  calculate ratios of variances for Agriculture coef for fit2 and fit3 w.r.t fit1
c(summary(fit2)$cov.unscaled[2,2], summary(fit3)$cov.unscaled[2,2]) / a - 1
[1] 0.8915757 1.0891588

#### anova()
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

分散分析表  
Res.Df = モデルの残差自由度  
RSS = (Residual Sum of Squares)モデルの残差平方和、適合度  
Df = あるモデルから次のモデルへの自由度の変化  
Sum of Sq = あるモデルから次のモデルへの残差平方和の差/変化  
F = F統計値(F statistic)、異なる変動源を反映する2つのスケーリングされた平方和の比率を測定  
Pr（> F）= (p-value for the F statistic)モデルの変化が有意であるかどうかを示すF統計のp値  
           = (両モデルの当てはまりの差は誤差の範囲内である確率)　　
　　　　　　優位水準を5%とすれば0.05以下であれば適合性が向上していると判断できる。
            
上記の結果から、1番目から2番目、2番目から3番目のモデルの両方でRSSが大幅に減少し、モデルの適合性が向上することがわかります。  

#### Step-wise Model Search

fit <- lm(mpg ~ cyl + disp + hp + drat + wt, data = mtcars)  
step(fit, k=log(nrow(mtcars)))  

k = ペナルティとして使われる自由度数の倍数． k=2 が本来の AIC 法を与える．
k=log(n) はしばしば BIC や SBC と呼ばれる

Start:  AIC=73.75
mpg ~ cyl + disp + hp + drat + wt
       Df Sum of Sq    RSS    AIC
- drat  1     3.018 170.44 70.854  <== この項目を削除した場合
- disp  1     6.949 174.38 71.584
- cyl   1    15.411 182.84 73.100
<none>              167.43 73.748  <== 何も削除しない場合
- hp    1    21.066 188.49 74.075
- wt    1    77.476 244.90 82.453

Step:  AIC=70.85                   <== 最も影響の少ない(AICの小さい)変数を削除したモデル
mpg ~ cyl + disp + hp + wt
       Df Sum of Sq    RSS    AIC
- disp  1     6.176 176.62 68.528
- hp    1    18.048 188.49 70.609
<none>              170.44 70.854
- cyl   1    24.546 194.99 71.694
- wt    1    90.925 261.37 81.069

<<略>>

Call:
lm(formula = mpg ~ cyl + wt, data = mtcars)

Coefficients:
(Intercept)          cyl           wt  
     39.686       -1.508       -3.191  


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
VIF統計量は一般的に10以下であれば多重共線性がないとされる。理想値は2以下

### 残差 (Residuals)
Yi = β0 + β*xi + εi  
ここで「誤差」 εi , i = 1, ... , n は統計的に独立 ですべて同じ分散 σ2 をもつ

「残差」：観測可能なデータに基く誤差の推定値

#### 分散分析：ANOVA
fit1 <- lm(Fertility~Agriculture,swiss)
fit3 <- lm(Fertility ~ Agriculture + Examination + Education, data=swiss)
anova(fit1, fit3)
Analysis of Variance Table

Model 1: Fertility ~ Agriculture
Model 2: Fertility ~ Agriculture + Examination + Education
  Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
1     45 6283.1                                  
2     43 3180.9  2    3102.2 20.968 4.407e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
表の右下にある3つのアスタリスク***は、帰無仮説が0.001レベルで拒否されることを示しているため、
2つの追加の回帰変数の少なくとも1つが重要です。
拒否は、F値に適用される右側FテストPr（> F）に基づいています。
計算されたp値に基づいて、帰無仮説が誤って拒否されることはほとんどありません。 fit3はfit1よりもはるかに優れていると確信しています。  
ただし、分散分析(analysis of variance)は、モデルの残差がほぼ正規分布であるという仮定に敏感です。
したがって、正規性について残差をテストする価値があります。 
Shapiro-Wilk検定はRでは迅速かつ簡単です。正規性は帰無仮説です。
shapiro.test(fit3$residuals) 

	Shapiro-Wilk normality test

data:  fit3$residuals
W = 0.97276, p-value = 0.336
0.336のShapiro-Wilk p値は正規性を棄却できず、分散分析の信頼性をサポートします。

anova(fit1, fit3, fit5, fit6)
Analysis of Variance Table

Model 1: Fertility ~ Agriculture
Model 2: Fertility ~ Agriculture + Examination + Education
Model 3: Fertility ~ Agriculture + Examination + Education + Catholic
Model 4: Fertility ~ Agriculture + Examination + Education + Catholic + 
    Infant.Mortality
  Res.Df    RSS Df Sum of Sq       F    Pr(>F)    
1     45 6283.1                                   
2     43 3180.9  2   3102.19 30.2107 8.638e-09 ***
3     42 2513.8  1    667.13 12.9937 0.0008387 ***
4     41 2105.0  1    408.75  7.9612 0.0073357 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
各モデルは、その前身を大幅に改善しているようです。


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

