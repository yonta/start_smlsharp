(*************************************************
 * listは以下のように定義されたデータ構造
 * datatype 'a list = [] | :: of 'a * 'a list
 * infix 5 ::
 *
 * 以下のような略記が用意されている
 * nil = []
 * [exp1, exp2, exp3] = exp1 :: exp2 :: exp3 :: []
 *************************************************)

(*************************************************
 * 1からnまでを要素に持つリストを生成する
 *************************************************)
fun makeList 0 = nil
  | makeList n = n :: makeList (n-1)
val makeList = rev o makeList

(*************************************************
 * listを引数として受け取り，長さを返す関数length
 * listはnilか::（cons）なので，case文でパターンマッチする
 *************************************************)
fun length l =
    case l of
      nil => 0
    | h :: t => 1 + length t
fun length nil = 0
  | length (h::t) = 1 + length t

(*************************************************
 * listでよく使われるfold関数
 *
 * 定義
 *  fun foldl f z nil = z
 *    | foldl f z (h::t) = foldl f (f (h, z)) t
 *
 * それっぽい解説
 *   関数fと初期値zとリスト[a1, a2, a3, ... , an]を受け取る．
 *   まずf (a1, z)を計算し，結果をz1とする．
 *   次にf (a2, z1)を計算し，結果をz2とする．
 *   繰り返す
 *   最後の計算結果znを返す．
 *     ※リストを左から順に関数fで処理していく関数がfoldl
 *       もちろんfoldrもあります
 *************************************************)
fun length' l = foldl (fn (_,z) => 1 + z) 0 l

(*************************************************
 * モジュールの中身の参照方法
 * structure L = List
 *************************************************)


