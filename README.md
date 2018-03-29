## 結論



checkboxのdone undoneをするために
どのチェックが押されたかの判断が必要
1. checkboxにkeyをフル
2. 文字列の内容で判断する(同じ内容のタスクで死亡)

1のやり方として
- js でkey順番にkey振る
- serverでhtml生成時にふっとく

## 選定軸
多分パフォーマンスよりメンテしやすさ, 負債にならなさ優先


| gem | result | ありな理由 |  md原文の位置特定 | reason |
| --- | ------ | ---------- | ----------------- | ------ |
| Commonmarker | o | serverの実装のみ | o 原文のROW COLを保持 |  |
| Qiitamarkdown | o | jsで連番振れば実装がミニマム, serverで振るならしたのでも | o 連番 | デフォで実装されてるがcheckboxの何個め判定の実装は必要, なぜかデフォでchecboxがdisabledなのでjsの実装はいる, serverでdisale解除はふさわしい実装ではなさそう |
| html-Pipeline | o | serverで連番振るとかqiitaオーバースペックなら  | qiitaはこれのラッパー qiitaのラッパーは変なclassとか付与されるからこっちもあり  | もともと処理を追加できる設計思想 |
| Redcarpet | 三角 | ない | o 連番 | 卜部さん曰くsegv |
| Kramdown | x | ない |  | check_boxするにはopen classしてoverrideしかない.また改行が二行必要などいけてない |
| Rdiscount | x | ない |  | Cの実装に手を出すはめになる |
