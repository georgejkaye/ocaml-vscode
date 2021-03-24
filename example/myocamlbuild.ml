open Ocamlbuild_plugin
 
let () =
  dispatch begin function
  | After_rules ->
     Pathname.define_context "src/Bar" ["src/Foo"]
  | _ -> ()
  end