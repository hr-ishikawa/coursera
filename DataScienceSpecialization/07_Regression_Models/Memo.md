### 残差 (Residuals)

## influence, leverage

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
rstudent(fit)                 ## 上記計算を実施  

#### Cook's distance 
dy <- predict(fitno, df) - predict(fit, df)  ## fitとfitnoの予測値の差
sum(dy^2)/(2*sigma^2)

cooks.distance(fit)           ## 上記計算を実施  




