#! /usr/bin/env ocamlscript
Ocaml.ocamlflags := ["-thread"];
Ocaml.packs := ["phat.async_unix"]
--
open Core.Std
open Async.Std
module Phat = Phat_async_unix.Std

let make_install_file ?src_prefix preserve_dirs root_dir src_dir
    : (Phat.rel_file * Phat.rel_file option) list Or_error.t Deferred.t
    =
  let base : Phat.rel_dir = Phat.Item (Phat.last_of_rel src_dir) in
  let src_prefix : Phat.rel_dir = match src_prefix with
    | None -> base
    | Some src_prefix -> Phat.concat src_prefix base
  in
  let dst_prefix = base in
  Phat.fold (Phat.concat root_dir src_dir) ~init:[] ~f:(fun accum x ->
    let x = match x with
      | `File x -> Some (
	Phat.concat src_prefix x,
	if preserve_dirs then Some (Phat.concat dst_prefix x) else None
      )
      | `Dir _ -> None
      | `Broken_link x -> (
	Log.Global.info "Skipping broken link %s" (Phat.to_string x);
	None
      )
    in
    return (x::accum)
  ) >>|?
  List.filter_map ~f:Fn.id >>|?
  List.rev


(******************************************************************************)
(* CLI                                                                        *)
(******************************************************************************)
(** Async_extra.Command is missing this function. See pull request:
    - https://github.com/janestreet/async_extra/pull/6
*)
let async_or_error' ~summary ?readme params main =
  Command.async_or_error ~summary ?readme (Command.Spec.of_params params) main


module Param = struct
  include Command.Param

  let log_level =
    flag "-log" (optional_with_default `Info Log.Level.arg)
      ~doc:(sprintf "level Log level can be debug, info, or error. \
                     Default is info.")

  let src_prefix =
    flag "-src-prefix" (optional Phat.Cli.rel_dir)
      ~doc:"DIR Additional prefix added to source file paths."

  let preserve_dirs =
    flag "-preserve-dirs" (optional_with_default false bool)
      ~doc:"BOOL Preserve directory structure. Default: false."

  let common_args remaining_args =
    log_level @> remaining_args

end

(** Handle [common_args] in a common way. Returns path to config
    file. *)
let common_handler log_level : unit Or_error.t Deferred.t =
  Log.Global.set_level log_level;
  return (Ok ())

let main : Command.t = async_or_error'
  ~summary:"print .install file lines"
  Param.(
    common_args @@
    src_prefix @> preserve_dirs @>
    anon ("ROOT_DIR" %: Phat.Cli.dir_of_any_kind) @>
    anon ("INSTALL_DIR" %: Phat.Cli.rel_dir) @>
    nil
  )
  (fun a src_prefix preserve_dirs root_dir src_dir () ->
    common_handler a >>=? fun () ->
    (match root_dir with
    | `Abs x -> return (Ok x)
    | `Rel x ->
       Unix.getcwd() >>|
       Phat.abs_dir >>|? fun cwd ->
       Phat.concat cwd x
    ) >>=? fun root_dir ->
    make_install_file ?src_prefix preserve_dirs root_dir src_dir >>=? fun l ->
    let stdout = force Writer.stdout in
    Deferred.Or_error.List.iter l ~f:(fun (src,dst) ->
      Writer.writef stdout "  \"%s\"" (Phat.to_string src);
      Option.value_map dst ~default:() ~f:(fun dst ->
        Writer.writef stdout " {\"%s\"}" (Phat.to_string dst)
      );
      Writer.newline stdout;
      return (Ok ())
    )
  )

let () =
  try Command.run ~version:"dev" main
  with e -> eprintf "%s\n" (Exn.to_string e)
