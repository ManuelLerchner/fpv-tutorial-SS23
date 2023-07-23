open Thread
open Event

type blog = string list
type user = string
type pass = string
type message = Post of user * pass * string | Read of user * blog channel
type t = message channel

let start_server users =
  let (ch : message channel) = new_channel () in

  let rec main db =
    let get_blogs user =
      match List.assoc_opt user db with None -> [] | Some blogs -> blogs
    in

    let curr_message = sync (receive ch) in
    let new_db =
      match curr_message with
      | Post (u, p, t) ->
          if List.assoc_opt u users = Some p then
            (u, get_blogs u @ [ t ]) :: List.remove_assoc u db
          else db
      | Read (u, c) ->
          let blogs = get_blogs u in
          sync (send c blogs);
          db
    in

    main new_db
  in
  let _ = Thread.create main [] in
  ch

let post s u p t = sync (send s (Post (u, p, t)))

let read s u =
  let ch = new_channel () in
  sync (send s (Read (u, ch)));
  sync (receive ch)
