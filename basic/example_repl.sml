(* (* (* COMMENT *) *) *)

(* Expression *)
val () = print "Expression\n";

(* int *)
1;
(* real *)
~1.0;
(* char *)
#"a";
(* string *)
"Test";
(* word *)
0wxff;
(* bool *)
false;
(* unit *)
();
(* list *)
1 :: [2,3];
nil;
(* intの計算 *)
2 * 4 div (5 - 3);
(* 型エラー *)
(*   2 * 4 / (5 - 3)   *)
(* if *)
if true orelse false andalso false then "True" else "False";

(* function *)
fn x => x mod 2;
(* application *)
it 15;

(* tuple *)
(1,0w15);
(* tuple selector *)
#1 it;

(* record *)
{name = "miku", age = 16};
{1 = #"a", 2 = ()};
(* record selector *)
#age;

(* constructor *)
datatype 'a mylist =
         NIL
       | CONS of 'a * 'a mylist;
CONS (1, CONS (2, NIL));
(* case *)
case it of
  NIL => false
| CONS _ => true;
case (1,2) of
  (0,0) => "ZEROS"
| (1,_) => "ONE"
| _ => "OTHER";

(* Declaration *)
val () = print "Declaration"

(* val *)
val nl = "\n"
(* fun *)
fun newline s = s ^ nl
(*
 * nlを束縛しなおしても，以前のnlは上書きされない
 *   ※代入ではない
 *)
val nl = " "

(* recursive function *)
fun fib 0 = 1
  | fib 1 = 1
  | fib n = fib (n-1) + fib (n-2)

(* let : let DECS in EXP end *)
fun fib n =
    let
      fun fibTailRec (s, t, 0) = t
        | fibTailRec (s, t, n) = fibTailRec (t, s+t, n-1)
    in
      fibTailRec (0, 1, n)
    end

(* higher order function *)
fun curry f x y = f (x,y)
fun uncurry f (x,y) = f x y
fun fact 0 = 1
  | fact n = n * fact (n-1)
fun factImpl (0, m) = m
  | factImpl (n, m) = fact' (n-1, m*n)
fun fact' n = factImpl (n, 1)
fun power m 0 = 1
  | power m n = m * power m (n-1)
fun siguma f 0 = 0
  | siguma f n = f n + siguma f (n-1)

(* infix *)
infix 0 <| |> <<
fun f <| x = f x
fun f |> g = g o f
fun f << g = f o g
