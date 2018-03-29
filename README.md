## 結論



checkboxのdone undoneをするために
どのチェックが押されたかの判断が必要
1. checkboxにkeyをフル
2. 文字列の内容で判断する(同じ内容のタスクで死亡)

1のやり方として
- js でkey順番にkey振る
- serverでhtml生成時にふっとく

| gem | result | md原文の位置特定 | reason |
|:--|:--:| | |
| RedcarpetWrapper | 三角 | o 連番 | 卜部さん曰くsegv |
| CommonmarkerWrapper | o | o 原文のROW COLを保持 |  |
| QiitaWrapper | o | o 連番 | デフォで実装されてるがcheckboxの何個め判定の実装は必要 |
| KramdownWrapper | x |  | check_boxするにはopen classしてoverrideしかない.また改行が二行必要などいけてない |
| RdiscountWrapper | x |  | Cの実装に手を出すはめになる |
| PipeWrapper | o | qiitaはこれのラッパー qiitaのラッパーは変なclassとか付与されるからこっちもあり  | もともと処理を追加できる設計思想 |
