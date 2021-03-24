open A

let hello = "Hello" ^ " " ^ "there"
let greet p = hello ^ " " ^ p ^ "!"

let chat p d m y = greet p ^ " \nYou are " ^ (string_of_int (age d m y)) ^ " years old."