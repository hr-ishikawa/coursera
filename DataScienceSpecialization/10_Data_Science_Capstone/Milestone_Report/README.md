## Task 3: Modeling

ここでの目標は、単語間の関係の最初の単純なモデルを構築することです。これは、予測テキストマイニングアプリケーションを構築する最初のステップです。単純なモデルを探索し、より複雑なモデリング手法を発見します。

#### 達成するタスク

1. 基本的なn-gramモデルの構築-実行した探索的分析を使用して、前の1、2、または3つの単語に基づいて次の単語を予測するための基本的なn-gramモデルを構築します。
2. 目に見えないn-gramを処理するモデルを作成します-場合によっては、コーパスに表示されない単語の組み合わせを入力する必要があります。特定のn-gramが観察されないケースを処理するモデルを構築します。

#### 考慮すべき質問

1. n-gramモデルをどのように効率的に保存できますか（マルコフ連鎖を考えてください）。
2. 単語の頻度に関する知識をどのように使用して、モデルをより小さく効率的にすることができますか？
3. 必要なパラメーターの数（つまり、n-gramモデルのnの大きさ）。
4. 確率を「滑らかにする」簡単な方法を考えてください（データで観測されていなくても、すべてのn-gramにゼロ以外の確率を与えることを考えてください）。
5. モデルが適切かどうかをどのように評価しますか？
6. バックオフモデルを使用して、観測されていないn-gramの確率を推定するにはどうすればよいですか？

#### ヒント、ヒント、およびコツ

予測モデルを開発する際、留意しなければならない2つの重要な側面は、アルゴリズムのサイズと実行時間です。これらは次のように定義されます：

1. size：Rでモデルを実行するために必要なメモリの量（物理RAM）
2. runtime：許容される入力が与えられた場合にアルゴリズムが予測を行うのに要する時間
この予測モデルの目標は、ユーザーに合理的なエクスペリエンスを提供するために、モデルのサイズと実行時間の両方を最小化することです。

現在使用可能な予測テキストモデルは携帯電話で実行できることに注意してください。携帯電話は通常、デスクトップコンピューターに比べてメモリと処理能力が限られています。したがって、非常に慎重に検討する必要があります（1）ワークスペース内のオブジェクトによって使用されているメモリ量。 （2）モデルの実行にかかる時間。最終的に、モデルはshinyapps.ioサーバーで実行されるShinyアプリで実行する必要があります。

#### ヒント、トリック、およびヒント

以下に、アルゴリズムの作業に役立ついくつかのツールを示します。

- object.size（）：この関数は、Rオブジェクトがメモリで占有するバイト数を報告します
- Rprof（）：この関数は、Rでプロファイラーを実行します。これを使用して、関数のボトルネックが存在する可能性がある場所を特定できます。 profrパッケージ（CRANで利用可能）は、プロファイリングデータを視覚化および要約するための追加ツールを提供します。
- gc（）：この関数は、ガベージコレクターを実行してRの未使用のRAMを取得します。このプロセスでは、Rが現在使用しているメモリ量を通知します。

サイズと実行時間の間でトレードオフが必要になる可能性があります。たとえば、大量のメモリを必要とするアルゴリズムは高速で実行され、低速のアルゴリズムはより少ないメモリで済みます。ユーザーに優れたエクスペリエンスを提供するためには、2つの間の適切なバランスを見つける必要があります。

## Milestone Report
このプロジェクトの目標は、データの操作に慣れており、予測アルゴリズムを作成するために順調に進んでいることを表示することです。 R Pubs(http://rpubs.com/) 探索的分析と、最終的なアプリとアルゴリズムの目標を説明したレポートを送信して、してください。 このドキュメントでは、特定したデータの主要な特徴のみを簡潔に説明し、データサイエンティスト以外のマネージャーが理解できる方法で予測アルゴリズムとShinyアプリを作成する計画を簡単に要約します。 データセットの重要な概要を示すために、テーブルとプロットを使用する必要があります。 このプロジェクトの動機は次のとおりです。
1. データをダウンロードし、正常にロードされたことを示します。
2. データセットに関する要約統計の基本的なレポートを作成します。
3. これまでに蓄積した興味深い発見を報告します。
4. 予測アルゴリズムとShinyアプリを作成するための計画に関するフィードバックを取得します。

#### Review criteria
1. リンクは、トレーニングデータセットの探索的分析を説明するHTMLページにつながりますか？
2. データサイエンティストは3つのファイルの基本的な要約を行っていますか？ ワードカウント、行カウント、基本データテーブル
3. データサイエンティストは、データの特徴を示すヒストグラムなどの基本的なプロットを作成しましたか？
4. レポートは、データサイエンティスト以外のマネージャーが理解できるように、簡潔で簡潔なスタイルで書かれていましたか？

#---------------------------  
## Task 3: Modeling

The goal here is to build your first simple model for the relationship between words. This is the first step in building a predictive text mining application. You will explore simple models and discover more complicated modeling techniques.

#### Tasks to accomplish

1. Build basic n-gram model - using the exploratory analysis you performed, build a basic n-gram model for predicting the next word based on the previous 1, 2, or 3 words.
2. Build a model to handle unseen n-grams - in some cases people will want to type a combination of words that does not appear in the corpora. Build a model to handle cases where a particular n-gram isn't observed.

#### Questions to consider

1. How can you efficiently store an n-gram model (think Markov Chains)?
2. How can you use the knowledge about word frequencies to make your model smaller and more efficient?
3. How many parameters do you need (i.e. how big is n in your n-gram model)?
4. Can you think of simple ways to "smooth" the probabilities (think about giving all n-grams a non-zero probability even if they aren't observed in the data) ?
5. How do you evaluate whether your model is any good?
5. How can you use backoff models to estimate the probability of unobserved n-grams?

#### Hints, tips, and tricks

As you develop your prediction model, two key aspects that you will have to keep in mind are the size and runtime of the algorithm. These are defined as:

1. Size: the amount of memory (physical RAM) required to run the model in R
2. Runtime: The amount of time the algorithm takes to make a prediction given the acceptable input
Your goal for this prediction model is to minimize both the size and runtime of the model in order to provide a reasonable experience to the user.

Keep in mind that currently available predictive text models can run on mobile phones, which typically have limited memory and processing power compared to desktop computers. Therefore, you should consider very carefully (1) how much memory is being used by the objects in your workspace; and (2) how much time it is taking to run your model. Ultimately, your model will need to run in a Shiny app that runs on the shinyapps.io server.

#### Tips, tricks, and hints

Here are a few tools that may be of use to you as you work on their algorithm:

- object.size(): this function reports the number of bytes that an R object occupies in memory
- Rprof(): this function runs the profiler in R that can be used to determine where bottlenecks in your function may exist. The profr package (available on CRAN) provides some additional tools for visualizing and summarizing profiling data.
- gc(): this function runs the garbage collector to retrieve unused RAM for R. In the process it tells you how much memory is currently being used by R.

There will likely be a tradeoff that you have to make in between size and runtime. For example, an algorithm that requires a lot of memory, may run faster, while a slower algorithm may require less memory. You will have to find the right balance between the two in order to provide a good experience to the user.

### Milestone Report

The goal of this project is just to display that you've gotten used to working with the data and that you are on track to create your prediction algorithm. Please submit a report on R Pubs (http://rpubs.com/) that explains your exploratory analysis and your goals for the eventual app and algorithm. This document should be concise and explain only the major features of the data you have identified and briefly summarize your plans for creating the prediction algorithm and Shiny app in a way that would be understandable to a non-data scientist manager. You should make use of tables and plots to illustrate important summaries of the data set. The motivation for this project is to: 
1. Demonstrate that you've downloaded the data and have successfully loaded it in.
2. Create a basic report of summary statistics about the data sets.
3. Report any interesting findings that you amassed so far.
4. Get feedback on your plans for creating a prediction algorithm and Shiny app.

#### Review criteria
1. Does the link lead to an HTML page describing the exploratory analysis of the training data set?
2. Has the data scientist done basic summaries of the three files? Word counts, line counts and basic data tables?
3. Has the data scientist made basic plots, such as histograms to illustrate features of the data?
4. Was the report written in a brief, concise style, in a way that a non-data scientist manager could appreciate?
