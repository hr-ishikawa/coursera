NEIは、毎年および各タイプのPM発生源について、年間を通じてその発生源から何トンのPM2.5が放出されたかを記録します。
この課題に使用するデータは、1999年、2002年、2005年、および2008年のものです。

審査基準
質問ごとに

1.プロットは、尋ねられている質問に対処しているように見えますか？
2.提出されたRコードは提出されたプロットの作成に適切ですか？

データ非表示
この課題のデータは、コースのWebサイトから単一のzipファイルとして入手できます。

ピア評価のためのデータ
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip[29Mb]
zipファイルには2つのファイルが含まれています。

PM2.5排出量データ（summarySCC_PM25.rds）：このファイルには、1999年、2002年、2005年、および2008年のPM2.5排出量データすべてを含む
データフレームが含まれています。毎年、この表にはPM2.5のトン数が含まれています。年間を通じて特定の種類の発生源から放出される。
これが最初の数行です。

-fips：米国の郡を示す5桁の数字（ストリングとして表される）
-SCC：数字列で示されるソースの名前（ソースコード分類表を参照）
 - 汚染物質：汚染物質を示す文字列
 - 排出量：トンで、排出されるPM2.5の量
-type：ソースの種類（ポイント、非ポイント、オンロード、または非ロード）
年：記録された排出年

ソース分類コード表（Source_Classification_Code.rds} Source_Classification_Code.rds）：
この表は、EmissionsテーブルのSCCディジット文字列からPM2.5ソースの実際の名前へのマッピングを提供します。
情報源は、より一般的なものからより具体的なものまで、いくつかの異なる方法で分類されており、
あなたはあなたが最も有用であると思うどんなカテゴリでも探求することを選択することができます。
たとえば、供給元「10100101」は「Ext Comb / Electric Gen /無煙炭/微粉炭」として知られています。

RのreadRDS（）関数を使用して、2つのファイルのそれぞれを読み取ることができます。
例えば、各ファイルの読み取りは、以下のコードで行うことができます。

##この最初の行は数秒かかるでしょう。我慢して！
NEI < -  readRDS（ "summarySCC_PM25.rds"）
SCC < -  readRDS（ "Source_Classification_Code.rds"）

これらの各ファイルが現在の作業ディレクトリにある限り（dir（）を呼び出して確認し、
それらのファイルがリストに含まれているかどうかを確認してください）。

#### 割り当て

この課題の全体的な目標は、National Emissions Inventoryデータベースを調べて、
1999年から2008年までの10年間にわたる米国における微粒子状物質汚染についての記述を確認することです。
あなたの分析をサポートしたい任意のRパッケージを使うことができます。

#### 質問

探索的分析では、以下の質問とタスクに対処する必要があります。
質問/課題ごとに、単一のプロットを作成する必要があります。
特に指定のない限り、あなたはあなたのプロットを作るためにRの中の
どんなプロットシステムを使うこともできます。

1.米国では、PM2.5からの総排出量が1999年から2008年にかけて減少しましたか。
ベースプロットシステムを使用して、1999年、2002年、2005年、
および2008年の各年について、全発生源からの総PM2.5排出量を示すプロットを作成します。

2. 1999年から2008年にかけて、メリーランド州ボルチモア市でPM2.5からの総排出量が減少しましたか（fips == "24510"）。
この質問に答えるプロットを作成するためにベースプロットシステムを使用してください。

3.変数（タイプ、ポイント、ノンポイント、オンロード、ノンロード）で示される4種類の排出源のうち、
1999年から2008年にかけてボルチモア市で排出量が減少したのはどれですか。 
1999年から2008年にかけて排出量が増加したのはどれですか。
プロットがこの質問に答えるようにするには、ggplot2プロットシステムを使用してください。

4.米国全体で、1999年から2008年にかけて、石炭燃焼関連の排出源からの排出量はどのように変化しましたか。

5.ボルチモア市では1999年から2008年にかけて自動車からの排出量はどのように変化しましたか。

6.ボルチモア市の自動車の発生源からの排出量をカリフォルニア州ロサンゼルス郡の自動車の発生源からの排出量と比較する（fips == "06037"）。どの都市で自動車排出量の経年変化が大きくなっていますか？

プロットの作成と提出

プロットごとに

 - プロットを作成してPNGファイルに保存します。
 - 対応するプロットを構成する別のRコードファイル（plot1.R、plot2.Rなど）を作成します。すなわち、plot1.Rのコードはplot1.pngプロットを構成します。プロットを完全に再現できるように、コードファイルにデータを読み取るためのコードを含める必要があります。 PNGファイルを作成するコードも含める必要があります。単一のプロットのコードのみを含める（つまり、plot1.Rはplot1.pngを生成するためのコードだけを含めるべきです）
 - 課題提出ページにPNGファイルをアップロードする
 - ピア評価の適切な時点で、対応するRファイルからテキストボックスにRコードをコピーして貼り付けます。


==============================================================
For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year. The data that you will use for this assignment are for 1999, 2002, 2005, and 2008.

Review criteria
For each question

1. Does the plot appear to address the question being asked?
2. Is the submitted R code appropriate for construction of the submitted plot?

Data非表示 
The data for this assignment are available from the course web site as a single zip file:

Data for Peer Assessment 
https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip[29Mb]
The zip file contains two files:

PM2.5 Emissions Data (summarySCC_PM25.rds): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year. Here are the first few rows.

-fips: A five-digit number (represented as a string) indicating the U.S. county
-SCC: The name of the source as indicated by a digit string (see source code classification table)
-Pollutant: A string indicating the pollutant
-Emissions: Amount of PM2.5 emitted, in tons
-type: The type of source (point, non-point, on-road, or non-road)
-year: The year of emissions recorded

Source Classification Code Table (Source_Classification_Code.rds}Source_Classification_Code.rds): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific and you may choose to explore whatever categories you think are most useful. For example, source “10100101” is known as “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.

You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

as long as each of those files is in your current working directory (check by calling dir() and see if those files are in the listing).

Assignment

The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999?2008. You may use any R package you want to support your analysis.

Questions

You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips=="24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999?2008 for Baltimore City? Which have seen increases in emissions from 1999?2008? Use the ggplot2 plotting system to make a plot answer this question.

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999?2008?

5. How have emissions from motor vehicle sources changed from 1999?2008 in Baltimore City?

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

Making and Submitting Plots

For each plot you should

- Construct the plot and save it to a PNG file.
- Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot (i.e. plot1.R should only include code for producing plot1.png)
- Upload the PNG file on the Assignment submission page
- Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.
