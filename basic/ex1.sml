(*************************************************
 * 1. 関数fizzbuzzを定義しましょう．
 *
 *  val fizzbuzz : int -> string
 *
 *  Examples. fizzbuzz 0 = "0"
 *            fizzbuzz 3 = "Fizz"
 *            fizzbuzz 5 = "Buzz"
 *            fizzbuzz 15 = "FizzBuzz"
 *
 *  Hints.    Int.toString : int -> string
 *************************************************)
fun fizzbuzz n =

(*************************************************
 * 2. 関数fizzbuzzを使い，1からnまでfizzbuzz結果を
 *    リストで返すfizzbuzzListを定義しましょう．
 *
 *  val fizzbuzzList : int -> string list
 *
 *  Example.  fizzbuzzList 5 =
 *               ["1", "2", "FIZZ", "4", "Buzz"]
 *
 *  Hints.  ::  : 'a * 'a list -> 'a list
 *          @   : 'a list * 'a list -> 'a list
 *          rev : 'a list -> 'a list
 *************************************************)
fun fizzbuzzList n =
