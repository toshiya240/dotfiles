# vim: fileencoding=utf-8
"""
AppHtml settings
@author Toshiya NISHIO(http://www.toshiya240.com)
"""

appTemplate = {
    '1) フル表示(SSフル+説明付)':u"""<h2><span class='appTitle'><a href='${url}' target='itunes_store'>${name}</a></span></h2>
<span class='appIcon'><img class='appIconImg' width='100' height='100' src='${icon100url}' style='float:left;border-radius: 22px;-moz-border-radius: 22px;-webkit-border-radius: 22px;margin: 0px 15px 15px 5px;'></span>
<span class='appVersion'>バージョン: ${version}</span><br>
<span class='appPubDate'>リリース日: ${pubdate}</span><br>
<span class='appPrice'>価格: ${price}(${today} 時点)</span><br>
<span class='appSize'>サイズ: ${appsize}</span><br style='clear: both;'>
<span class='appCategory'>カテゴリ: ${category}</span><br>
<span class='appSeller'>販売元: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='appCurVerRating'>現在のバージョンの評価: ★${curuserrating}（${curuserratingcnt}）</span><br>
<span class='appAllVerRating'>全てのバージョンの評価: ★${userrating}（${userratingcnt}）</span><br>
<span class='appUniv'>${univ}</span>
<span class='appGamecenter'>${gamecenter}</span>
<br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span><br>
<span class='appDescNew'><strong>What’s New</strong></span><br>
${descnew}<br>
<br>
${image1} ${image2} ${image3} ${image4} ${image5}<br>
<br>
${univimage1} ${univimage2} ${univimage3} ${univimage4} ${univimage5}<br>
<br>
<span class='appDesc'><strong>Description</strong></span><br>
${desc}
""",
    '2) フル表示(SS2枚)':u"""<h2><span class='appTitle'><a href='${url}' target='itunes_store'>${name}</a></span></h2>
<span class='appIcon'><img class='appIconImg' width='100' height='100' src='${icon100url}' style='float:left;border-radius: 22px;-moz-border-radius: 22px;-webkit-border-radius: 22px;margin: 0px 15px 15px 5px;'></span>
<span class='appVersion'>バージョン: ${version}</span><br>
<span class='appPubDate'>リリース日: ${pubdate}</span><br>
<span class='appPrice'>価格: ${price}(${today} 時点)</span><br>
<span class='appSize'>サイズ: ${appsize}</span><br style='clear: both;'>
<span class='appCategory'>カテゴリ: ${category}</span><br>
<span class='appSeller'>販売元: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='appCurVerRating'>現在のバージョンの評価: ★${curuserrating}（${curuserratingcnt}）</span><br>
<span class='appAllVerRating'>全てのバージョンの評価: ★${userrating}（${userratingcnt}）</span><br>
<span class='appUniv'>${univ}</span>
<span class='appGamecenter'>${gamecenter}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span><br>
<br>
${image1} ${image2}<br>
""",
    '3) 中アイコン表示': u"""<span class='appIcon'><img class='appIconImg' width='100' height='100' src='${icon100url}' style='float:left;border-radius: 22px;-moz-border-radius: 22px;-webkit-border-radius: 22px;margin: 0px 15px 15px 5px;'></span>
<span class='appName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='appVersion'>バージョン: ${version}</span><br>
<span class='appPrice'>価格: ${price}(${today} 時点)</span><br>
<span class='appSize'>サイズ: ${appsize}</span><br style='clear: both;'>
<span class='appCategory'>カテゴリ: ${category}</span><br>
<span class='appSeller'>販売元: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='appAllVerRating'>全てのバージョンの評価: ★${userrating}（${userratingcnt}）</span><br>
<span class='appUniv'>${univ}</span>
<span class='appGamecenter'>${gamecenter}</span>
<br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '4) 小アイコン表示': u"""<span class='appIcon'><img width='60' height='60' class='appIconImg' src='${icon60url}' style='float:left;border-radius: 13px;-moz-border-radius: 13px;-webkit-border-radius: 13px;margin: 0px 15px 15px 5px;'></span>
<span class='appName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='appVersion'>バージョン: ${version}</span><br>
<span class='appPrice'>価格: ${price}(${today} 時点)</span><br style='clear: both;'>
<span class='appCategory'>カテゴリ: ${category}</span><br>
<span class='appSeller'>販売元: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='appUniv'>${univ}</span>
<span class='appGamecenter'>${gamecenter}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '5) リンクのみ': u"<span class='appTitle'>${textonly}</span>",
    '6) 予約語一覧': u"""<pre>
名前: ${name}
ストアリンク: ${url}
価格: ${price}
カテゴリ: ${category}
リリース日: ${pubdate}
アートワーク(100): <img src='${icon100url}'/>
アートワーク(60): <img src='${icon60url}' />
アーティスト: <a href='${artisturl}'>${artist}</a>
販売者: <a href='${sellerurl}'>${seller}</a>
説明文: ${desc}
説明文(New): ${descnew}
バージョン: ${version}
レーティング: ${rating}
全★: ${userrating}(${userratingcnt})
現★: ${curuserrating}(${curuserratingcnt})
サイズ: ${appsize}
動作環境: ${moveos}
動作環境２: ${os}
GameCenter: ${gamecenter}
ユニバーサル: ${univ}
言語: ${lang}
スクショ: ${image1} ${image2} ${image3} ${image4} ${image5}
スクショ２: ${univimage1} ${univimage2} ${univimage3} ${univimage4} ${univimage5}
実行日: ${today}
</pre>
"""
}

songTemplate = {
    '1) 中アイコン表示': u"""<span class='songIcon'><img class='songIconImg' width='100' height='100' src='${icon100url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='songName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='songArtist'>アーティスト: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='songPrice'>価格: ${price}(${today} 時点)</span><br>
<span class='songCategory'>カテゴリ: ${category}</span><br>
<span class='songRelease'>リリース: ${pubdate}</span><br style='clear: both;'>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '2) 小アイコン表示': u"""<span class='songIcon'><img width='60' height='60' class='songIconImg' src='${icon60url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='songName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='songArtist'>アーティスト: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='songPrice'>価格: ${price}(${today} 時点)</span><br style='clear: both;'>
<span class='songCategory'>カテゴリ: ${category}</span><br>
<span class='songRelease'>リリース: ${pubdate}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '3) リンクのみ': u"<span class='songTitle'>${textonly}</span>",
    '4) 予約語一覧': u"""<pre>
名前: ${name}
ストアリンク: ${url}
プレビューURL: ${preview}
価格: ${price}
カテゴリ: ${category}
トラック数: ${trackcnt}
リリース日: ${pubdate}
アートワーク(100): <img src='${icon100url}'/>
アートワーク(60): <img src='${icon60url}' />
アーティスト: <a href='${artisturl}'>${artist}</a>
販売者: <a href='${sellerurl}'>${seller}</a>
実行日: ${today}
</pre>
"""
}

albumTemplate = {
    '1) 中アイコン表示': u"""<span class='albumIcon'><img class='albumIconImg' width='100' height='100' src='${icon100url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='albumName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='albumArtist'>アーティスト: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='albumTrackCount'>トラック数: ${trackcnt}</span><br>
<span class='albumPrice'>価格: ${price}(${today} 時点)</span><br style='clear: both;'>
<span class='albumCategory'>カテゴリ: ${category}</span><br>
<span class='albumRelease'>リリース: ${pubdate}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '2) 小アイコン表示': u"""<span class='albumIcon'><img width='60' height='60' class='albumIconImg' src='${icon60url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='albumName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='albumArtist'>アーティスト: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br style='clear: both;'>
<span class='albumTrackCount'>トラック数: ${trackcnt}</span><br>
<span class='albumPrice'>価格: ${price}(${today} 時点)</span><br>
<span class='albumCategory'>カテゴリ: ${category}</span><br>
<span class='albumRelease'>リリース: ${pubdate}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '3) リンクのみ': u"<span class='albumTitle'>${textonly}</span>",
    '4) 予約語一覧': u"""<pre>
名前: ${name}
ストアリンク: ${url}
価格: ${price}
カテゴリ: ${category}
トラック数: ${trackcnt}
リリース日: ${pubdate}
アートワーク(100): <img src='${icon100url}'/>
アートワーク(60): <img src='${icon60url}' />
アーティスト: <a href='${artisturl}'>${artist}</a>
販売者: <a href='${sellerurl}'>${seller}</a>
Copyright: ${copyr}
実行日: ${today}
</pre>
"""
}

movieTemplate = {
    '1) 中アイコン表示(説明付)': u"""<span class='movieIcon'><img class='movieIconImg' height='100' src='${icon100url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='movieName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='moviePrice'>価格: ${price}(${today} 時点)</span><br>
<span class='moviePlaytime'>再生時間: ${playtime}</span><br>
<span class='movieCategory'>カテゴリ: ${category}</span><br style='clear: both;'>
<span class='movieRelease'>リリース: ${pubdate}</span><br>
<span class='movieArtist'>監督: ${artist}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span><br>
${desc}
""",
    '2) 中アイコン表示': u"""<span class='movieIcon'><img class='movieIconImg' height='100' src='${icon100url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='movieName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='moviePrice'>価格: ${price}(${today} 時点)</span><br>
<span class='moviePlaytime'>再生時間: ${playtime}</span><br>
<span class='movieCategory'>カテゴリ: ${category}</span><br style='clear: both;'>
<span class='movieRelease'>リリース: ${pubdate}</span><br>
<span class='movieArtist'>監督: ${artist}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '3) 小アイコン表示': u"""<span class='movieIcon'><img height='60' class='movieIconImg' src='${icon60url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='movieName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='moviePrice'>価格: ${price}(${today} 時点)</span><br>
<span class='moviePlaytime'>再生時間: ${playtime}</span><br style='clear: both;'>
<span class='movieCategory'>カテゴリ: ${category}</span><br>
<span class='movieRelease'>リリース: ${pubdate}</span><br>
<span class='movieArtist'>監督: ${artist}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '4) リンクのみ': u"<span class='movieTitle'>${textonly}</span>",
    '5) 予約語一覧': u"""<pre>
名前: ${name}
ストアリンク: ${url}
プレビューURL: ${previewbtn}
価格: ${price}
カテゴリ: ${category}
再生時間: ${playtime}
リリース日: ${pubdate}
アートワーク(100): <img src='${icon100url}'/>
アートワーク(60): <img src='${icon60url}' />
アーティスト: <a href='${artisturl}'>${artist}</a>
販売者: <a href='${sellerurl}'>${seller}</a>
説明: ${desc}
短い説明: ${shortdesc}
実行日: ${today}
</pre>
"""
}

ebookTemplate = {
    '1) 中アイコン表示(説明付)': u"""<span class='ebbokIcon'><img class='ebookIconImg' height='100' src='${icon100url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='ebookName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='ebookArtist'>著者: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='ebookPrice'>価格: ${price}(${today} 時点)</span><br>
<span class='ebookCategory'>カテゴリ: ${category}</span><br style='clear: both;'>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span><br>
${desc}
""",
    '2) 中アイコン表示': u"""<span class='ebookIcon'><img class='ebookIconImg' height='100' src='${icon100url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='ebookName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='ebookArtist'>著者: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='ebookPrice'>価格: ${price}(${today} 時点)</span><br>
<span class='ebookCategory'>カテゴリ: ${category}</span><br style='clear: both;'>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '3) 小アイコン表示': u"""<span class='ebookIcon'><img height='60' class='ebookIconImg' src='${icon60url}' style='float:left;margin: 0px 15px 15px 5px;'></span>
<span class='ebookName'><strong><a href='${url}' target='itunes_store'>${name}</a></strong></span><br>
<span class='ebookArtist'>著者: <a href='${artisturl}' target='itunes_store'>${artist}</a></span><br>
<span class='ebookPrice'>価格: ${price}(${today} 時点)</span><br style='clear: both;'>
<span class='ebookCategory'>カテゴリ: ${category}</span><br>
<span class='badgeL' style='display:inline-block; margin:4px'>${badgeL}</span>
""",
    '4) リンクのみ': u"<span class='movieTitle'>${textonly}</span>",
    '5) 予約語一覧': u"""<pre>
名前: ${name}
ストアリンク: ${url}
価格: ${price}
カテゴリ: ${category}
リリース日: ${pubdate}
アートワーク(100): <img src='${icon100url}'/>
アートワーク(60): <img src='${icon60url}' />
アーティスト: <a href='${artisturl}'>${artist}</a>
販売者: <a href='${sellerurl}'>${seller}</a>
説明: ${desc}
★: ${userrating}(${userratingcnt})
実行日: ${today}
</pre>
"""
}

settings = {
    'phg': "11l3RK",
    'cnt': 8,
    'scs': {
        'iphone': 320,
        'ipad': 320,
        'mac': 480
    },
    'template': {
        'software': appTemplate,
        'iPadSoftware': appTemplate,
        'macSoftware': appTemplate,
        'song': songTemplate,
        'album': albumTemplate,
        'movie': movieTemplate,
        'ebook': ebookTemplate
    }
}
