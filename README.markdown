# SML チートシート

## 概要
* SMLは宣言を並べていく言語
  * 宣言同士は;で区切れる（省略可）
  * REPLの多くは;ごとにコンパイルが走る
* ファイル拡張子は.sml
  * シグネチャーは.sig
  * SML#ではインタフェースファイル.smiもある
  * NJではコンパイル用に.cm、MLtonでは.mlbなども

## チートシート

* 値・関数宣言
  * 後述するパターンマッチを引数部に使える
```sml
val x = 1
fun add x y = x + y
fun mul 0 _ = 0
| mul x y = x * y
```

* コメント
```sml
(* comment (* nested *) *)
```

* 基本的な値
  * マイナスは~
  * :で型を自分で書ける
```sml
val unit = ()
val char = chr (ord (#"c"))
val string = "str" ^ "ing"
val int = 10 div 2 mod 3
val real = ~1.0
val bool = if true andalso false orelse true
then true
else false
val lambda = fn (x : real) => 3.0 * x + 1.0
```

* 組、タプル
```sml
(* 構成 *)
val tuple = (1, #"c", "string")
(* 分解 *)
val int = #1 tuple
val c = #2 tuple
```

* レコード
  * 前述の組はフィールド名が1から始まる数字のレコードにすぎない
```sml
(* 構成 *)
val record = {name = "koro", age = 16}
(* 分解 *)
val n = #name record
val a = #age record
```

* リスト
```sml
(* 構成 *)
val list = []
val list = nil
val list = 1 :: 2 :: nil
val list = [1, 2]
(* 分解 *)
val head = hd list
val tail = tl list
```

* オプション型
```sml
(* 構成 *)
val some = SOME 1
val none = NONE
(* 分解 *)
val int = valOf some
```

* 代数的データ型
  * 分解に使われるのはパターンマッチ
  * 組・レコード・リスト・オプション等にも使える
  * 特にオプションで出たvalOfは例外発生の可能性があるため、caseでパターンマッチすべき
  * _はワイルドカード
```sml
(* 構成 *)
datatype mytype = A | B of int | C
(* 分解、パターンマッチ *)
val a =
case B 1 of
A => 0
| B n => n
| _ => ~1
```

* スコープ
  * let 宣言 in 式 end
  * local 宣言 in 宣言 end
  * endが必要な理由はでこにゃんに聞け
```sml
val x =
let
val x = 1
in
x + 1
end
local
val a = 2
in
fun f x = x + a
end
```

* 例外
```sml
(* 構成 *)
exception Error of string
raise Error "Missed"
(* 分解 *)
raise Error "Missed"
handle e message => ()
```

* モジュール
  * typeは型の別名付け
  * :を:>にすると型の実装が隠され、外から見ると隠蔽された型となる
  * openでモジュールを展開できるが、名前環境がシャドウイングされる可能性があるためオススメしない
```sml
(* 構成 *)
signature MY_SIG =
sig
type t
val zero : () -> t
val succ : t -> t
end
structure MyModule : MY_SIG =
struct
type t = int
fun zero () = 0
fun succ t = t + 1
end
(* 分解 *)
val t = MyModule.zero()
open MyModule
val t = succ t
```

* 既存ライブラリ
  * [ここ](http://sml-family.org/Basis/)の[これ](http://sml-family.org/Basis/index-all.html)とかで探す
    * SMLはBasisライブラリという基本ライブラリが定義されている
    * 各種処理系のライブラリもあるのでそれは各処理系のドキュメント参照
  * REPL上でも以下のopenを使うと見れることが多い
```sml
open List
```

* ファンクター
  * モジュールを動的に作る
  * val、type、structureなどが引数にとれた、はず
```sml
(* 構成 *)
functor AddSub (structure Module : MY_SIG) =
struct
open Module
fun sub (x : t) = x - 1
end
(* 分解 *)
structure NewModule = AddSub(MyModule)
```