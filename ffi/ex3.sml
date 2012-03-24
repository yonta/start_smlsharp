(*************************************************
 * 1. 先の例ではCのprintfを文字列のみを受け取る関数と
 *    してインポートしました．
 *    今度はprintfを，フォーマットを表す文字列と，数字
 *    の2つを受けとってプリントする関数として読み込みなさい
 *************************************************)

val printf = (* ここを埋める *)

fun makeInts 0 = nil
  | makeInts n = makeInts (n-1) @ [n]
fun makeStrings n =
    let
      fun makeStrings' 0 = nil
        | makeStrings' n  = Int.toString n ^ ": %d\n" :: makeStrings' (n-1)
    in
      rev (makeStrings' n)
    end
val formats = ListPair.zip (makeStrings 10, makeInts 10)
val _ = map printf formats

(*************************************************
 * 2. 下記URLを参考にMersenne Twister乱数をスタティックリンクで
 *    呼び出して見ましょう
 * http://www.pllab.riec.tohoku.ac.jp/smlsharp/ja/?Resources%2FProgrammingExamples%2FMT
 *************************************************)
