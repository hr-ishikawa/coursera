### Statistics by example activities

Statistics is the discipline of analyzing data. As such it intersects heavily with data science, machine learning and, of course, traditional statistical analysis. In this lecture, we orient you to statistics by covering a few key activities that define the field. These are:

1. Descriptive statistics
2. Inference
3. Prediction
4. Experimental Design
---
1. 記述統計
2. 推論
3. 予測
4. 実験計画
---

Descriptive statistics includes exploratory data analysis, unsupervised learning, clustering and basic data summaries. Descriptive statistics have many uses, most notably helping us get familiar with a data set. Descriptive statistics usually are the starting point for any analysis. Often, descriptive statistics help us arrive at hypotheses to be tested later with more formal inference.

Inference is the process of making conclusions about populations from samples. Inference includes most of the activities traditionally associated with statistics such as: estimation, confidence intervals, hypothesis tests and variability. Inference forces us to formally define targets of estimations or hypotheses. It forces us to think about the population that we're trying to generalize to from our sample.

Prediction overlaps quite a bit with inference, but modern prediction tends to have a different mindset. Prediction is the process of trying to guess an outcome given a set of realizations of the outcome and some predictors. Machine learning, regression, deep learning, boosting, random forests and logistic regression are all prediction algorithms. If the target of prediction is binary or categorical, prediction is often called classification. In modern prediction, emphasis shifts from building small, parsimonious, interpretable models to focusing on prediction performance, often estimated via cross validation. Generalizability is often given not by a sampling model, as in traditional inference, but by challenging the algorithm on novel datasets. Prediction has transformed many fields include e-commerce, marketing and financial forecasting.
Experimental design is the act of controlling your experimental process to optimize the chance of arriving at sound conclusions. The most notable example of experimental design is randomization. In randomization a treatment is randomized across experimental units to make treatment groups as comparable as possible. Clinical trials and A/B testing both employ randomization. In random sampling, one tries to randomly sample from a population of interest to get better generalizability of the results to the population. Many election polls try to get a random sample.

---
記述統計には、探索的データ分析、教師なし学習、クラスタリング、および基本的なデータの要約が含まれます。記述統計には多くの用途があり、最も顕著なのはデータセットに慣れるのに役立ちます。通常、記述統計は分析の開始点です。多くの場合、記述統計は、より正式な推論で後でテストする仮説に到達するのに役立ちます。

推論は、サンプルから母集団について結論を出すプロセスです。推論には、推定、信頼区間、仮説検定、変動性などの統計に伝統的に関連付けられているアクティビティのほとんどが含まれます。推論により、推定または仮説のターゲットを正式に定義する必要があります。サンプルから一般化しようとしている母集団について考える必要があります。

予測は推論とかなり重複しますが、現代の予測は異なる考え方を持つ傾向があります。予測は、結果といくつかの予測子の一連の実現を前提として、結果を推測しようとするプロセスです。機械学習、回帰、ディープラーニング、ブースティング、ランダムフォレスト、ロジスティック回帰はすべて予測アルゴリズムです。予測のターゲットがバイナリまたはカテゴリーの場合、予測はしばしば分類と呼ばれます。現代の予測では、小さく、節約的で解釈可能なモデルを構築することから、しばしばクロス検証によって推定される予測パフォーマンスに焦点を当てることに重点がシフトします。一般化可能性は、従来の推論のようにサンプリングモデルによってではなく、新しいデータセットのアルゴリズムに挑戦することによって与えられることがよくあります。予測は、eコマース、マーケティング、財務予測など、多くの分野を変えました。

実験計画とは、適切な結論に達する可能性を最適化するために実験プロセスを制御する行為です。実験計画の最も注目すべき例は、ランダム化です。ランダム化では、治療グループを可能な限り同等にするために、実験ユニット全体で治療がランダム化されます。臨床試験とA / Bテストはどちらもランダム化を採用しています。ランダムサンプリングでは、対象の母集団からランダムにサンプリングして、母集団に対する結果のより一般化を取得しようとします。多くの選挙調査では、ランダムなサンプルを取得しようとしています。

---

## Machine learning

Machine learning has been a revolution in modern prediction and clustering. Machine learning has become an expansive field involving computer science, statistics and engineering. Some of the algorithms have their roots in artificial intelligence (like neural networks and deep learning).

For data scientists, we decompose two main activities of machine learning. (Of course, this list is non-exhaustive.) These are are

1. Unsupervised learning - trying to uncover unobserved factors in the data. It is called "unsupervised" as there is no gold standard outcome to judge against. Some example algorithms including hierarchical clustering, principal components analysis, factor analysis and k-means.
2. Supervised learning - using a collection of predictors, and some observed outcomes, to build an algorithm to predict the outcome when it is not observed. Some examples include: neural networks, random forests, boosting and support vector machines.

We give a famous early example of unsupervised clustering in the computation of the g-factor. This was postulated to be a measure of intrinsic intelligence. Early factor analytic models were used to cluster scores on psychometric questions to create the g-factor. Notice the lack of a gold standard outcome. There was no true measure of intrinsic intelligence to train an algorithm to predict it.

For supervised learning, we give an early example, the development of regression. In this, Francis Galton wanted to predict children's heights from their parents. He developed linear regression in the process. Notice that having several children with known adult heights along with their parents allows one to build the model, then apply it to parents who are expecting.

It is worth contrasting modern machine learning and prediction with more traditional statistics. Traditional statistics has a great deal of overlap with machine learning, including models that produce very good predictions and methods for clustering. However, there is much more of an emphasis in traditional statistics on modeling and inference, the problem of extending results to a population. Modern machine learning was somewhat of a revolution in statistics not only because of the performance of the algorithms for supervised and unsupervised problems, but also from a paradigm shift away from a focus on models and inference. Below we characterize some of these differences.

For this discussion, I would summarize (focusing on supervised learning) some characteristics of ML as:

- the emphasis on predictions;
- evaluating results via prediction performance;
- having concern for overfitting but not model complexity per se;
- emphasis on performance;
- obtaining generalizability through performance on novel datasets;
- usually no superpopulation model specified;
- concern over performance and robustness.
---
機械学習は、現代の予測とクラスタリングの革命です。機械学習は、コンピューターサイエンス、統計、およびエンジニアリングを含む広大な分野になりました。一部のアルゴリズムは、人工知能に根ざしています（ニューラルネットワークやディープラーニングなど）。

データサイエンティストの場合、機械学習の2つの主要なアクティビティを分解します。 （もちろん、このリストは網羅的ではありません。）これらは

教師なし学習-データ内の観測されていない要因を明らかにしようとしています。判断基準となるゴールドスタンダードの結果がないため、「監視なし」と呼ばれます。階層的クラスタリング、主成分分析、因子分析、k-meansを含むアルゴリズムの例。
教師あり学習-予測子のコレクションといくつかの観察された結果を使用して、観察されない場合に結果を予測するアルゴリズムを構築します。例には、ニューラルネットワーク、ランダムフォレスト、ブースティングおよびサポートベクターマシンが含まれます。
gファクターの計算における教師なしクラスタリングの有名な初期の例を示します。これは本質的な知性の尺度であると仮定されました。初期の因子分析モデルを使用して、心理測定質問のスコアをクラスター化し、g因子を作成しました。ゴールドスタンダードの結果がないことに注意してください。アルゴリズムを訓練して予測するための固有の知能の真の尺度はありませんでした。

教師あり学習については、初期の例である回帰の開発を示します。この中で、フランシス・ガルトンは両親から子供の身長を予測したかった。彼はその過程で線形回帰を開発しました。両親と一緒に既知の大人の身長を持つ複数の子供を持つことで、モデルを構築し、それを期待している親に適用することができます。

現代の機械学習と予測を従来の統計と比較する価値があります。従来の統計は、非常に優れた予測を生成するモデルやクラスタリングの方法など、機械学習と大きく重複しています。ただし、モデリングと推論に関する従来の統計では、結果を母集団にまで広げるという問題がずっと重視されています。現代の機械学習は、教師付きおよび教師なしの問題に対するアルゴリズムのパフォーマンスだけでなく、モデルと推論への焦点からのパラダイムシフトからも、統計学においていくらか革命的でした。以下に、これらの違いのいくつかを特徴付けます。

MLの特徴の要約
- 予測の強調
- 予測パフォーマンスによる結果の評価
- モデルの複雑さ自体ではなく、過剰適合に対する懸念
- パフォーマンスの重視
- 新規データセットのパフォーマンスを通じて一般化可能性を取得
- 通常、スーパーポピュレーションモデルは指定されていません
- パフォーマンスと堅牢性に関する懸念。
---

In contrast, I would characterize the typical characteristics of traditional statistics as:

伝統的な統計の典型的な特徴

- emphasizing superpopulation inference;
- focusing on a-priori hypotheses;
- preferring simpler models over complex ones (parsimony), even if the more complex models perform slightly better;
- emphasizing parameter interpretability;
- having statistical modeling or sampling assumptions that connect data to a population of interest;
- having concern over assumptions and robustness.
---
- スーパーポピュレーションの推論を強調
- 先験的仮説に焦点を当てる
- より複雑なモデルのパフォーマンスがわずかに優れている場合でも、複雑なモデルよりも単純なモデルを優先します（節約）
- パラメータの解釈可能性を強調
- データを関心のある母集団に結び付ける統計的モデリングまたはサンプリングの仮定
- 仮定と堅牢性に懸念
---

In recent years, the distinction between both fields have substantially faded. ML researchers have worked tirelessly to improve interpretations while statistical researchers have improved the prediction performance of their algorithms.


## The Structure of a Data Science Project

1. Question
2. EDA
3. Formal Model 
4. Interpretation
5. Communication
---
1. 質問
2. 探索的データ分析
3. 正式なモデリング
4. 解釈
5. コミュニケーション
---

## The outputs of a data science experiment

The potential set of outputs of a data science experiment are pretty much limitless. However, four general types of outputs pop up most frequently. Those are:

1. Reports
2. Presentations
3. Interactive web pages
4. Apps

(Interactive graphics are important enough to merit their own category. However, they're usually embedded in a web page, so I'm lumping them in there.) Let's discuss each of the categories in turn.

Reports are easily the most common output of a data science experiment. Since the goals of reports varies wildly across settings, let's simply discuss a few hallmarks of a good data science report. It should:

- Be clearly written
- Involve a narrative around the data
- Discuss the creation of the analytic dataset
- Have concise conclusions
- Omit unnecessary details
- Reproducible
---
- 明確に書かれている
- データに関する物語を巻き込む
- 分析データセットの作成について話し合う
- 簡潔な結論を出す
- 不要な詳細を省略
- 再現可能
---

By and large, these points are obvious. However, this latter point is one that we discuss a lot throughout the specialization. Reproducible reports have mechanisms under the hood to recreate the data analysis. The number of benefits of report writing in this fashion are many. They include: getting the data scientist to think about the output of the process (since the code is embedded in the eventual output), very clear documentation that extends beyond code commenting, automation of the report generation process and then, of course, reproducibility. The main tools for producing reproducible reports are kntir and ipython notebooks. You should create a culture of using these tools, or similar ones, in your organization, as they will dramatically improve reproducibility.

Oddly enough, the same rules apply to presentations, though reproducible presentation software is less well adopted. For R, there's slidify and rStudio's presenter. These tools automate presentations in the same way that knitr and ipython notebooks automate report generation.

Interactive web pages and apps are similar enough to combined in the discussion. Again, as the requirements will vary so much across applications, we will only discuss a few hallmarks of good output. These include:

- Good ease of use / design
- Good documentation
- Code commented
- Code version controlled

Good ease of use and design are a discipline unto themselves. Since your data scientists are likely also not software engineers or designers, their design is probably not going to be optimal. However, modern tools allow data scientists to prototype apps and interactive web pages quickly and relatively easily. Your data scientists should then pay some attention to ease use and design. Good documentation is mostly effort, though the same caveats apply with design.

On the other hand, having well commented code and version control should be standard practice for data scientists. Well commented code is easy to return to for new employees or the original coder returning to the project after a long hiatus. Version control is similar good practice. With version control, data scientists will be able to return to any checked in version of the project. The comments are useful for documenting the evolution of the project as well. Tools such as git and github make version control easy and are in the standard toolkit of data scientists.

---
概して、これらのポイントは明らかです。ただし、この後者のポイントは、スペシャライゼーション全体を通して多くのことを議論するポイントです。再現可能なレポートには、データ分析を再現するための内部メカニズムがあります。この方法でレポートを作成する利点は数多くあります。データサイエンティストにプロセスの出力について考えさせる（最終的な出力にコードが埋め込まれているため）、コードのコメントを超えた非常に明確なドキュメント、レポート生成プロセスの自動化、そしてもちろん再現性。再現可能なレポートを作成するための主なツールは、kntirおよびipythonノートブックです。組織でこれらのツールまたは類似のツールを使用する文化を作成する必要があります。これらは再現性を大幅に向上させるためです。

奇妙なことに、同じルールがプレゼンテーションにも適用されますが、再現可能なプレゼンテーションソフトウェアはあまり採用されていません。 Rには、slidifyとrStudioのプレゼンターがいます。これらのツールは、knitrおよびipythonノートブックがレポート生成を自動化するのと同じ方法でプレゼンテーションを自動化します。

インタラクティブなWebページとアプリは、ディスカッションで組み合わせるのに十分似ています。繰り返しになりますが、要件はアプリケーションによって大きく異なるため、良い出力のいくつかの特徴についてのみ説明します。これらには以下が含まれます。

- 使いやすさ/デザインの良さ
- 優れたドキュメント
- コードがコメントされました
- コードバージョン管理

使いやすさとデザインの良さは、それ自体が規律です。データサイエンティストもソフトウェアエンジニアやデザイナーではない可能性が高いため、おそらく彼らの設計は最適ではありません。ただし、最新のツールを使用すると、データサイエンティストはアプリやインタラクティブなWebページのプロトタイプを迅速かつ比較的簡単に作成できます。データサイエンティストは、使用と設計を容易にするために注意を払う必要があります。同じ注意事項が設計にも当てはまりますが、適切な文書化は主に労力です。

一方、コードとバージョン管理を十分にコメントすることは、データサイエンティストの標準的なプラクティスです。よくコメントされたコードは、新しい従業員や元のコーダーが長い休止期間を経てプロジェクトに戻った場合に簡単に戻ることができます。バージョン管理も同様の良い習慣です。バージョン管理により、データサイエンティストはプロジェクトのチェックインバージョンに戻ることができます。コメントは、プロジェクトの進化を文書化するのにも役立ちます。 gitやgithubなどのツールは、バージョン管理を容易にし、データサイエンティストの標準ツールキットに含まれています。

---

## The four secrets of a successful data science experiment

Defining success is a crucial part of managing a data science experiment. Of course, success is often context specific. However, some aspects of success are general enough to merit discussion. My list of hallmarks of success includes:

1. New knowledge is created.
2. Decisions or policies are made based on the outcome of the experiment.
3. A report, presentation or app with impact is created.
4. It is learned that the data can't answer the question being asked of it.

Some more negative outcomes include: decisions being made that disregard clear evidence from the data, equivocal results that do not shed light in one direction or another, uncertainty prevents new knowledge from being created.

---
成功を定義することは、データサイエンス実験を管理する上で重要な部分です。 もちろん、成功は多くの場合コンテキスト固有です。 ただし、成功のいくつかの側面は、議論に値するほど一般的です。 私の成功の特徴のリストは次のとおりです。

1. 新しい知識が作成されます。
2. 決定またはポリシーは、実験の結果に基づいて行われます。
3. 影響のあるレポート、プレゼンテーション、アプリが作成されます。
4. データは、求められている質問に答えることができないことがわかります。

より否定的な結果には、データからの明確な証拠を無視する決定、ある方向または別の方向に光を当てない曖昧な結果、不確実性が新しい知識の作成を妨げることが含まれます。





