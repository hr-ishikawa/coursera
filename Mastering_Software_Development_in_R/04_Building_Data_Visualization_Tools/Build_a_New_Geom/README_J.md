この割り当ての目的は、グリッドとggplot2パッケージの知識を活用して、新しいgeomを構築することです。次に、地図にgeomをプロットするために、提供されたデータセットをロードして整頓する必要があります。

ハリケーンは非対称の風の場を持つことができ、嵐の片側の風が他の風に比べてはるかに強くなります。ハリケーンの風の半径は、ハリケーンの中心から特定の強度（34、50、64ノットなど）の風がどれだけ遠くまで広がったかを報告し、嵐の北東、北西、南東、および南西の象限に個別の値を指定します。たとえば、北東の象限の34ノット半径は、その象限で34ノットの風を受けた場所の嵐の中心から最も遠い距離を報告します。

この風の半径のデータは、嵐の位置と最大風のより単純な測定よりも、嵐の構造のより明確な画像を提供します。たとえば、嵐が非常に速く動いている場合、嵐の前方運動は嵐の前方運動方向の右側の風速に大きく寄与している可能性があり、風の半径は嵐の北東象限よりもはるかに大きい可能性があります北西の象限。これらの風の半径は、1988年以降、Extended Best Tractデータセットを通じて大西洋流域の熱帯暴風雨に利用できます。http：//rammb.cira.colostate.edu/research/tropical_cyclones/tc_extended_best_track_dataset/

2005年8月29日12時00分00秒（UTC）に記録された暴風雨観測のハリケーンカトリーナの風半径チャートの例を次に示します。

#### For this assessment, you will need to

1. ggplot2のカスタムジオムを作成します。これを使用して、単一の嵐観測用のハリケーン風半径チャートをマップに追加できます（つまり、上記の図を再作成するために使用できます）。
2. geomを使用してマッピングし、2008年9月に発生したハリケーン池の1回の観測時間での風速図を示すマップを作成します。嵐が米国の近くまたは上空であった観測時間を使用します。

#### More Specifics

More specifically, you will need to

- 1988年から2015年までの大西洋沿岸のすべての嵐に関するデータをダウンロードし（ベストトラックを延長）、データセットを「長い」形式に整頓します。 
(1) ストーム名と年を組み合わせたstorm_idの列を追加します（異なるストームの同じストーム名を使用できるため、ストームを一意に識別できます）。 
(2) 経度をフォーマットして、数値であり、西半球の位置に負の値が含まれるようにします（これにより、マッピングに経度を使用しやすくなります）。 
(3) 日付と時刻を記述する列をフォーマットおよび結合して、各観測の日付と時刻を持つ単一の変数を作成します。 
(4) データを「長い」形式に変換し、風の半径の3つの風速（34ノット、50ノット、64ノット）ごとに別々の行を使用します。たとえば、ハリケーンカトリーナの単一の観測ポイントのクリーンアップされたデータセットは、データが整理された後、次のようになります。
```{r}
library(tidyverse)
library(lubridate)
setwd('coursera')
dfw <- read_table('ebtrk_atlc_1988_2015.txt', col_names=F)
df <- dfw %>% mutate(storm_id =str_c(str_to_title(X2),'-',X4),
                     date     =ymd_h(str_c(X4,X3)),
                     latitude =X5, longitude=-X6,
                     w34=X13, w50=X14, w64=X15    ) %>%
              select(-starts_with('X')) %>%
              gather(key=wind_speed, value=Data, w34,w50,w64) %>%
              mutate(wind_speed=as.integer(str_sub(wind_speed,2,3))) %>%
              arrange(storm_id,date,wind_speed) %>% 
              mutate(ne=as.integer(str_sub(Data, 1, 3)),
                     nw=as.integer(str_sub(Data,10,12)),
                     se=as.integer(str_sub(Data, 4, 6)),
                     sw=as.integer(str_sub(Data, 7, 9)) ) %>%
              select(-Data)
df %>% filter(storm_id=='Katrina-2005') %>% tail(35)

##       storm_id                date latitude longitude wind_speed  ne  nw  se  sw
## 1 Katrina-2005 2005-08-29 12:00:00     29.5     -89.6         34 200 100 200 150
## 2 Katrina-2005 2005-08-29 12:00:00     29.5     -89.6         50 120  75 120  75
## 3 Katrina-2005 2005-08-29 12:00:00     29.5     -89.6         64  90  60  90  60
```

- マッピングする特定のハリケーン（ハリケーンアイク）とそのハリケーンの単一の観測時間へのサブセット
- 単一のハリケーン観測の風の半径をプロットする「geom_hurricane」という名前のgeomのコードを記述します。たとえば、このgeomがkatrinaという名前のデータセットを含むggplotオブジェクトに追加され、上記の嵐の単一の観測点のデータを使用すると、次のプロットが得られます。

```{r}
ggplot(data = katrina) +
  geom_hurricane(aes(x = longitude, y = latitude,
                     r_ne = ne, r_se = se, r_nw = nw, r_sw = sw,
                     fill = wind_speed, color = wind_speed)) +
  scale_color_manual(name = "Wind speed (kts)",
                     values = c("red", "orange", "yellow")) +
  scale_fill_manual(name = "Wind speed (kts)",
                    values = c("red", "orange", "yellow")) 
```
- このgeomを使用して、ハリケーンの風の半径のチャートをベースマップに追加できることを確認するためのテスト。たとえば、ルイジアナ州地域のマップを使用してbase_mapという名前のggmapオブジェクトを作成した場合、次のコードにより、コードの下にマップが表示されます。

```{r}
map_data <- get_map("Louisiana", zoom = 6, maptype = "toner-background")
base_map <- ggmap(map_data, extent = "device")

base_map +
  geom_hurricane(data = katrina, aes(x = longitude, y = latitude,
                                       r_ne = ne, r_se = se,
                                       r_nw = nw, r_sw = sw,
                                       fill = wind_speed,
                                       color = wind_speed)) +
  scale_color_manual(name = "Wind speed (kts)",
                     values = c("red", "orange", "yellow")) +
  scale_fill_manual(name = "Wind speed (kts)",
                    values = c("red", "orange", "yellow"))
```
ヒントとして、風の半径geomには、本質的に各風レベルのポリゴンが表示されることに注意してください。したがって、このジオムを記述するための1つのアプローチは、風の半径を使用してポリゴンの境界に沿ったポイントを計算するハリケーン統計とジオムの組み合わせを記述し、ポリゴンジオムから継承するジオムを作成することです。開始緯度と経度から緯度と経度の値を計算する方法の詳細については、geosphereパッケージのビネット（https://cran.r-project.org/web/packages/geosphere/vignettes/geosphere.pdf）を参照してください。距離、および方位。これは、風の半径から利用可能なデータを使用してポリゴン境界を計算する方法についてのアイデアを得るのに役立ちます。

- 風の半径は、各象限の特定の方向の風の最大半径範囲を提供します。状況によっては、各四分円の平均露出のより良いアイデアを得るために、最大風半径の特定の割合をプロットすることができます。たとえば、これらの最大風半径の80％である半径に基づいてグラフをプロットできます。 geomにscale_radiiというパラメーターを含めます。これにより、ユーザーは最大半径の特定の割合に縮小された半径で風半径チャートをプロットできます。たとえば、ユーザーが「scale_radii = 0.8」を設定した場合、geomは各象限の最大風半径の80％の範囲をマッピングする風半径チャートをプロットする必要があります。
- 他のパッケージから関数が呼び出される場合、適切な::表記を使用してそれらの関数を参照する必要があります（例：「mutate」ではなく「dplyr :: mutate」）。このパッケージをコードとしてRパッケージに含めるように記述している場合、この手順は非常に重要です。これは、別のユーザーがRセッションで読み込んだパッケージ（および順序）に対してコードが堅牢であることを保証するためです。 package :: function表記を使用することにより、ユーザーが特定のパッケージの関数を使用するようにします。例外は、オペランドの間に置かれる％>％のような中置演算子です。中置演算子の場合、package :: function表記を使用しないでください。
- geomのヘルプファイル情報を提供するroxygen2形式のドキュメントを書く

### Step-By-Step Assignment Instructions

The hurricane data is a bit tricky to read into R so we provide some code for doing so. After downloading the data from Coursera, unzip the zip file and you should have a file named "ebtrk_atlc_1988_2015.txt" on your computer. You can read the data in as follows.

```{r}
ext_tracks_widths <- c(7, 10, 2, 2, 3, 5, 5, 6, 4, 5, 4, 4, 5, 3, 4, 3, 3, 3,
                       4, 3, 3, 3, 4, 3, 3, 3, 2, 6, 1)
ext_tracks_colnames <- c("storm_id", "storm_name", "month", "day",
                          "hour", "year", "latitude", "longitude",
                          "max_wind", "min_pressure", "rad_max_wind",
                          "eye_diameter", "pressure_1", "pressure_2",
                          paste("radius_34", c("ne", "se", "sw", "nw"), sep = "_"),
                          paste("radius_50", c("ne", "se", "sw", "nw"), sep = "_"),
                          paste("radius_64", c("ne", "se", "sw", "nw"), sep = "_"),
                          "storm_type", "distance_to_land", "final")

ext_tracks <- read_fwf("ebtrk_atlc_1988_2015.txt", 
                       fwf_widths(ext_tracks_widths, ext_tracks_colnames),
                       na = "-99")
```

このコードを実行すると、Rワークスペースに「ext_tracks」という名前のオブジェクトが作成されます。このコードを実行する前に、データファイルが**作業ディレクトリ**にあることを確認してください。

データを読み取った後、それを整理し、単一の嵐の単一の観測時間にサブセットする必要があります。これにより、このようなデータセットで、単一の嵐、単一の日付（その観測）、単一の中央の嵐の位置、各風の強さ（34、50、および64ノット）の3つの行、および4つの象限のそれぞれの特定の強さの風の半径の列：

```{r}
#      storm_id                date latitude longitude wind_speed  ne  nw  se
## Katrina-2005 2005-08-29 12:00:00     29.5     -89.6         34 200 100 200
## Katrina-2005 2005-08-29 12:00:00     29.5     -89.6         50 120  75 120
## Katrina-2005 2005-08-29 12:00:00     29.5     -89.6         64  90  60  90
#   sw
## 150
##  75
##  60
```
これらのgeomは、棒グラフで極座標を使用してggplot2でかなり簡単に作成できるウィンドローズ図に似ていますが、ここではそのアプローチの使用に注意する必要があります。風半径チャートは各半径内の地理的位置を表示する必要があります。そのため、中心緯度と経度と半径に基づいて風半径チャートの周囲の緯度と経度の位置を計算するコードをジオムを作成するときに含める必要があります。このステップを行うには、**geosphere**のようなパッケージの関数を使用することができます。元のデータの風の半径は海里で報告されていることに注意してください。ジオムがポリゴンジオムのような別のジオムから継承する場合は問題ありません。

ジオムを作成したら、次のコードのようなものを使用して、ベースマップに風の半径のチャートを追加できるはずです（ジオムの記述方法に基づいて、呼び出しはこれと少し異なる場合があります）。
```{r}
library(ggmap)
get_map("Louisiana", zoom = 6, maptype = "toner-background") %>%
  ggmap(extent = "device") +
  geom_hurricane(data = storm_observation,
                 aes(x = longitude, y = latitude, 
                     r_ne = ne, r_se = se, r_nw = nw, r_sw = sw,
                     fill = wind_speed, color = wind_speed)) + 
  scale_color_manual(name = "Wind speed (kts)", 
                     values = c("red", "orange", "yellow")) + 
  scale_fill_manual(name = "Wind speed (kts)", 
                    values = c("red", "orange", "yellow"))
```
次のグラフは、ハリケーンカトリーナのチャートをマッピングする際の実際のscale_radiiオプションの例を示しています。 左側のプロットはscale_radiiのデフォルト値（1である必要があります）を使用しているため、最大半径に基づいて風の半径チャートを表示しています。 右側のプロットのscale_radii値は0.5であるため、最大半径値の50％にスケーリングされた風の半径に基づいたグラフを表示しています。

### Review criteria

この課題を送信するには、送信する必要があります

1. geomを実装するコードを含むRスクリプト
2. ハリケーンアイクの風の半径がオーバーレイされたマップを含むプロットファイル（PNGまたはPDF形式）

この評価では、校閲者に次の質問をします。

1. ハリケーンアイクの単一の観測時間の風の半径を示すマップが含まれていますか？
2. マップに正しいハリケーンが表示されていますか？
3. geomは、中心点、半径、および方向に基づいて、風の半径の位置を正しくマップしますか？
4. 他のパッケージの関数の呼び出しに適切な表記法が使用されていますか？
5. Rスクリプトにroxygen2スタイルのドキュメントが含まれていますか？
6. geomのすべてのパラメーターは文書化および説明されていますか？
7. geomには、説明どおりに機能するscale_radiiパラメーターが含まれていますか？
