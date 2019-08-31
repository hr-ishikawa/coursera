このピア評価課題には2つの部分があります。最初に、Shinyアプリケーションを作成し、Rstudioのサーバーにデプロイします。次に、SlidifyまたはRstudio Presenterを使用して、アプリケーションに関する再現可能なピッチプレゼンテーションを準備します。

### 光沢のあるアプリケーション

1. 関連するサポートドキュメントを含む光沢のあるアプリケーションを作成します。ドキュメントは、ユーザーがアプリケーションの使用を開始するために必要なものと見なす必要があります。
2. Rstudioの光沢のあるサーバーにアプリケーションをデプロイします
3. 提供されたテキストボックスに貼り付けて、アプリケーションリンクを共有します
4. githubでserver.Rとui.Rのコードを共有します

アプリケーションには以下を含める必要があります。

1. 何らかの形式の入力（ウィジェット：テキストボックス、ラジオボタン、チェックボックスなど）
2. sever.Rのui入力に対するいくつかの操作
3. サーバー計算の結果として表示される反応的な出力
4. また、初心者ユーザーがアプリケーションを使用できるように、十分なドキュメントを含める必要があります。
5. ドキュメントは、Shiny Webサイト自体にある必要があります。外部リンクに投稿しないでください。

問題の光沢のあるアプリケーションは完全にあなた次第です。ただし、アイデアを思いつかない場合は、クラスで行われた単純な予測アルゴリズムから始めて、Rデータセットパッケージの1つで新しいアルゴリズムを構築できます。アプリケーションを評価するために多くの前提知識を必要としないように、エンドユーザーにとってパッケージをシンプルにしてください。短い時間枠を考慮して、単純なプロジェクトを強調する必要があります。

#### 再現可能なピッチプレゼンテーション

さて、あなたは光沢のあるアプリを作成しました。今度はピッチを作成するときです。 5つのスライド（タイトルスライドを含む）を取得して、アプリを売り込みます。 SlidifyまたはRstudio Presenterを使用して、html5スライドデッキでWebページを作成します。

必要なものは次のとおりです

1. SlidifyまたはRstudio Presenterで行われたアイデアを売り込むための5つのスライド
2. githubまたはRpubsにプッシュされたプレゼンテーション
3. 提供されたテキストボックスに貼り付けられたgithubまたはRpubsプレゼンテーションへのリンク

プレゼンテーションは次の条件を満たす必要があります

1. SlidifyまたはRstudio Presenterで実行する必要があります
2. 5ページでなければなりません
3. githubまたはRpubsでホストする必要があります
4. ドキュメントのスライド時に実行される埋め込みRコードが含まれている必要があります

注：SlidifyはRpubsとの互換性がなくなりました。 Slidifyを使用する場合は、GitHubページを使用してプレゼンテーションを共有する必要があります。

slidifyプレゼンテーションをgithubまたはRpubsに公開することに注意してください。publishコマンドがあります。このリンクは、その方法の概要を示しています（1行です）。

http://slidify.org/publish.html

Rstudioプレゼンターには、Rpubs https://support.rstudio.com/hc/en-us/articles/200714023-Displaying-and-Distributing-Presentationsに直接公開するためのボタンがあります。 Rpubsを使用している場合は、https：//リンクではなくhttp：//リンクとしてプレゼンテーションへのリンクを送信ボックスに入力します。

両方の形式を使用してgh-pagesを使用して手動でgithubに公開することもできますが、githubブランチには.nojekyllファイルがあり、ブランチ名がgh-pagesである必要があります。 ghページにはhttps://pages.github.com/の詳細があり、これを行う方法の概要を説明するビデオ講義があります。

### レビュー基準
#### 光沢のあるアプリケーション

- ユーザーがアプリケーションを使い始めるのに十分なドキュメントが光沢のあるサイトにありましたか？
- アプリケーションはドキュメントの説明に従って実行されましたか？
ui.RまたはカスタムWebページのいずれかに、何らかの形式のウィジェット入力（スライダー、テキストボックス、ラジオボタン、チェックボックスなど）がありましたか？
- server.Rはserver.Rの入力でいくつかの計算を実行しましたか？
- サーバー計算はHTMLページに表示されましたか？
- アプリは、クラスで構築された非常にシンプルなアプリケーションとは実質的に異なりましたか？アプリがシンプルで、クラスで提示されたものに基づいていれば問題ありません。基本的に、ここで取り上げた例のカーボンコピーにしたくないだけです。たとえば、誰かが単に変数名を変更した場合、これはカウントされません。ただし、同様のレイアウトの予測アルゴリズムであれば問題ありません。
- アプリを+1することで、よくできている、すっきりしている、さらにはしっかりした努力をすることができます。

#### 再現可能なピッチ

- プレゼンテーションはslidifyまたはR Presenterで完了しましたか？
- 5ページでしたか？
- 評価および表示されたR式が含まれていましたか？
- 評価および表示されたR式が含まれていましたか？
- githubまたはRpubsでホストされていましたか？
- サーバー計算はHTMLページに表示されましたか？
- このプレゼンテーションに良い結果を出すための+1を行う機会があります。彼らはデフォルトのスタイルをいじくり回しましたか？プレゼンテーションは特に明快でよく整理されていましたか？言い換えれば、学生は正当な試みをしました。
- プレゼンテーションにRエラーが表示されませんでした。

======================================================
This peer assessed assignment has two parts. First, you will create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.

### Your Shiny Application

1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on Rstudio's shiny server
3. Share the application link by pasting it into the provided text box
4. Share your server.R and ui.R code on github

The application must include the following:

1. Some form of input (widget: textbox, radio button, checkbox, ...)
2. Some operation on the ui input in sever.R
3. Some reactive output displayed as a result of server calculations
4. You must also include enough documentation so that a novice user could use your application.
5. The documentation should be at the Shiny website itself. Do not post to an external link.

The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.

#### Your Reproducible Pitch Presentation

OK, you've made your shiny app, now it's time to make your pitch. You get 5 slides (inclusive of the title slide) to pitch a your app. You're going to create a web page using Slidify or Rstudio Presenter with an html5 slide deck.

Here's what you need

1. 5 slides to pitch our idea done in Slidify or Rstudio Presenter
2. Your presentation pushed to github or Rpubs
3. A link to your github or Rpubs presentation pasted into the provided text box

Your presentation must satisfy the following

1. It must be done in Slidify or Rstudio Presenter
2. It must be 5 pages
3. It must be hosted on github or Rpubs
4. It must contained some embedded R code that gets run when slidifying the document

NOTE: Slidify is no longer compatible with with Rpubs. If you choose to use Slidify you must share your presentation using GitHub Pages.

Notice to publish your slidify presentation to github or Rpubs, there's the publish command. This link outlines how to do it (it's one line).

http://slidify.org/publish.html

Rstudio presenter has a button to publish directly to Rpubs https://support.rstudio.com/hc/en-us/articles/200714023-Displaying-and-Distributing-Presentations. If you are using Rpubs, put in the link to the presentation into the submission box as a http:// link not a https:// link.

You can also publish using both formats to github manually using gh-pages, though your github branch must have a .nojekyll fle and be on a branch names gh-pages. There's more on gh-pages here https://pages.github.com/ and there is a video lecture outlining how to do this.

### Review criteria
#### Your Shiny Application

- Was there enough documentation on the shiny site for a user to get started using the application?
- Did the application run as described in the documentation?
Was there some form of widget input (slider, textbox, radio buttons, checkbox, ...) in either ui.R or a custom web page?
- Did server.R perform some calculations on the input in server.R?
- Was the server calculation displayed in the html page?
- Was the app substantively different than the very simple applications built in the class? Note, it's OK if the app is simple and based on the one presented in class. I just don't want it to be basically a carbon copy of the examples we covered. For example, if someone simply changed the variable names, then this would not count. However, a prediction algorithm that had a similar layout would be fine.
- Here's your opportunity to give the app +1 for being well done, or neat, or even just a solid effort.

#### Your Reproducible Pitch

- Was the presentation completed in slidify or R Presenter?
- Was it 5 pages?
- Did it contain an R expression that got evaluated and displayed?
- Did it contain an R expression that got evaluated and displayed?
- Was it hosted on github or Rpubs?
- Was the server calculation displayed in the html page?
- Here's your opportunity to give this presentation a +1 for being well done. Did they tinker around with the default style? Was the presentation particularly lucid and well organized? In other words, the student made a legitimate try.
- There were no R errors displayed in the presentation.
