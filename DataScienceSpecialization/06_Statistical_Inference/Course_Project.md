## 統計推論コースプロジェクト

プロジェクトは2つの部分で構成されています。

1. シミュレーション演習
2. 基本推論データ分析

質問に答えるためのレポートを作成します。シリーズの性質を考えると、理想的にはレポートを作成してpdfに変換するためにknitrを使用します。 （私は非常に簡単な紹介をknitrに投稿します）。しかし、あなたがあなたのpdfを作成したいと思うどんなソフトウェアでも自由に使ってください。

各pdfレポートは3ページ以下で、必要に応じて3ページの補足資料（コード、図など）を含むべきではありません。

### 審査基準

 - 分布の中心にある場所を示し、それを分布の理論上の中心と比較しましたか。
 - あなたはそれがどれほど変動的であるかを示し、そしてそれを分布の理論的分散と比較しましたか？
 - データの基本的な特徴を強調した少なくとも1つのプロットまたは表の探索的データ分析を実行しましたか？
 - 生徒はいくつかの信頼区間やテストを行いましたか？
 - テストの結果や間隔は問題の文脈で正しく解釈されましたか。
 - 学生は自分の結論に必要な仮定を説明しましたか？

### パート1：シミュレーション演習の手順

このプロジェクトでは、Rの指数分布を調べ、それを中心極限定理と比較します。指数分布はRでrexp（n、lambda）でシミュレートできます。ここで、lambdaはレートパラメータです。指数分布の平均は1 /λ、標準偏差も1 /λです。全てのシミュレーションに対してλ＝ ０．２を設定する。あなたは40の指数の平均の分布を調べます。あなたは千のシミュレーションをする必要があることに注意してください。

シミュレーションおよび関連する説明文を介して、40の指数の平均の分布の特性を説明します。あなたがすべき

1. 標本平均を表示し、それを分布の理論的平均と比較します。
2. 標本が（分散を介して）どの程度可変であるかを示し、それを分布の理論的分散と比較します。
3. 分布がほぼ正規分布であることを示します。

ポイント3では、ランダムな指数の大規模なコレクションの分布と40の指数の平均の大規模なコレクションの分布の違いに注目してください。

やる気を起こさせる例として、1000人のランダムなユニフォームの分布を比較する
ヒストリー（runif（1000））

40個のランダムなユニフォームの平均1000個の分布
mns = NULL
（i in 1：1000）mns = c（mns、平均（runif（40）））
ヒストリー（分）

この分布は、元の一様分布よりもはるかにガウス分布に見えます。

この演習では、2つの分布を関連付けるためにクラスで与えられた理論についてのあなたの知識を使うように求めています。

混乱した？このプロジェクトを完成させる方法についての初心者のためのビデオ講義07をもう一度見てみてください。

### サンプルプロジェクトレポート構造

もちろん、上記の要件に対処するためにレポートを作成する方法は複数あります。ただし、各質問を明確に提示して回答するほど、レビュー担当者は自分の作業を明確に識別して評価することが容易になります。

レポート作成の指針として使用できる見出しのサンプルセットは、次のとおりです。

 - タイトル（適切なタイトルを付ける）と著者名
 - 概観：いくつかの（2-3）文章で何が報告されるのかを説明しています。
 - シミュレーション：あなたが実行したシミュレーションの英語の説明を添付のRコードとともに含めます。あなたの説明はRコードが達成することを明確にするはずです。
 - 標本平均と理論平均：タイトル付きの数字を含める。図では、比較している手段を強調表示します。図とそれらに表示される内容を説明し、適切な番号を提供するテキストを含めます。
 - 標本分散対理論的分散：タイトル付きの数値（Rからの出力）を含める。比較している差異を強調表示します。差異の違いについての理解を説明するテキストを含めます。
 - 分布：図とテキストを使って、分布がほぼ正規であると言う方法を説明します。

### パート2：基本的な推論データ分析の指示

プロジェクトの後半では、RデータセットパッケージのToothGrowthデータを分析します。

1. ToothGrowthデータを読み込み、いくつかの基本的な探索的データ分析を実行します
2. データの基本的な要約を記入してください。
3. 信頼区間および/または仮説検定を使用して、サプリおよび投与による歯の成長を比較します。 （考慮する価値のある他のアプローチがある場合でも、クラスからのテクニックのみを使用してください）

あなたの結論とあなたの結論に必要な仮定を述べなさい。

---------------------------------------------------------
## Statistical Inference Course Project

The project consists of two parts:

 1. A simulation exercise.
 2. Basic inferential data analysis.

You will create a report to answer the questions. Given the nature of the series, ideally you'll use knitr to create the reports and convert to a pdf. (I will post a very simple introduction to knitr). However, feel free to use whatever software that you would like to create your pdf.

Each pdf report should be no more than 3 pages with 3 pages of supporting appendix material if needed (code, figures, etcetera).

### Review criteria

- Did you show where the distribution is centered at and compare it to the theoretical center of the distribution?
- Did you show how variable it is and compare it to the theoretical variance of the distribution?
- Did you perform an exploratory data analysis of at least a single plot or table highlighting basic features of the data?
- Did the student perform some relevant confidence intervals and/or tests?
- Were the results of the tests and/or intervals interpreted in the context of the problem correctly?
- Did the student describe the assumptions needed for their conclusions?

### Part 1: Simulation Exercise Instructions

In this project you will investigate the exponential distribution in R and compare it with the Central Limit Theorem. The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter. The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda. Set lambda = 0.2 for all of the simulations. You will investigate the distribution of averages of 40 exponentials. Note that you will need to do a thousand simulations.

Illustrate via simulation and associated explanatory text the properties of the distribution of the mean of 40 exponentials. You should

1. Show the sample mean and compare it to the theoretical mean of the distribution.
2. Show how variable the sample is (via variance) and compare it to the theoretical variance of the distribution.
3. Show that the distribution is approximately normal.

In point 3, focus on the difference between the distribution of a large collection of random exponentials and the distribution of a large collection of averages of 40 exponentials.

As a motivating example, compare the distribution of 1000 random uniforms  
hist(runif(1000))

and the distribution of 1000 averages of 40 random uniforms  
mns = NULL  
for (i in 1 : 1000) mns = c(mns, mean(runif(40)))  
hist(mns)  

This distribution looks far more Gaussian than the original uniform distribution!

This exercise is asking you to use your knowledge of the theory given in class to relate the two distributions.

Confused? Try re-watching video lecture 07 for a starter on how to complete this project.

### Sample Project Report Structure

Of course, there are multiple ways one could structure a report to address the requirements above. However, the more clearly you pose and answer each question, the easier it will be for reviewers to clearly identify and evaluate your work.

A sample set of headings that could be used to guide the creation of your report might be:

- Title (give an appropriate title) and Author Name
- Overview: In a few (2-3) sentences explain what is going to be reported on.
- Simulations: Include English explanations of the simulations you ran, with the accompanying R code. Your explanations should make clear what the R code accomplishes.
- Sample Mean versus Theoretical Mean: Include figures with titles. In the figures, highlight the means you are comparing. Include text that explains the figures and what is shown on them, and provides appropriate numbers.
- Sample Variance versus Theoretical Variance: Include figures (output from R) with titles. Highlight the variances you are comparing. Include text that explains your understanding of the differences of the variances.
- Distribution: Via figures and text, explain how one can tell the distribution is approximately normal.

### Part 2: Basic Inferential Data Analysis Instructions

Now in the second portion of the project, we're going to analyze the ToothGrowth data in the R datasets package.

1. Load the ToothGrowth data and perform some basic exploratory data analyses
2. Provide a basic summary of the data.
3. Use confidence intervals and/or hypothesis tests to compare tooth growth by supp and dose. (Only use the techniques from class, even if there's other approaches worth considering)
4. State your conclusions and the assumptions needed for your conclusions.

