# Week 13: Threads

In ocaml we can use the `Thread` module to create threads. The `Thread` module provides a `create` function that takes a function and its arguments and runs it in a new thread. It returns a `Thread.t` object, which represents the handle to the thread. We can use the `join` function to wait for the thread to finish.

```ocaml
let my_function sec = Thread.delay sec ; print_endline "Hello world!" ;;

let t = Thread.create my_function 5.0 ;;
Thread.join t ;;

print_endline "Done!" ;;
```

This code will print "Hello world!" after 5 seconds. The main thread will wait for the thread to finish before printing "Done!", because of the `Thread.join` call.

## Returning values from threads

As you can see above the `Thread.create` function returns a `Thread.t` object. So there is no direct way of accessing the return value of the thread. For this we use the `Event` module. The `Event` module provides a `new_channel` which can be used to create a communication channel between threads.

It has two important methods:

1. `Event.send`: This method takes a channel and a value and sends the value to the channel.
2. `Event.receive`: This method takes a channel and attempts to receive a value from the channel

We use the `Event.sync` method to wait for the value to be received at the other end of the channel (If we wrap it around a `Event.send` call). Or wait
block until we can receive a value from the channel (If we wrap it around a `Event.receive` call).

Note that this method blocks the thread until the underlying event is completed.

```ocaml
let my_costly_function (x, response_channel) =
  (* Perform heavy calculations  *)
  let result = x * x in
  Thread.delay 5.0 ;
  (* Wait for the response to be read by someone *)
  Event.sync (Event.send response_channel result) ;;

let response_channel = Event.new_channel () ;;

let t = Thread.create my_costly_function (5, response_channel) ;;

(* Wait for the response to be sent by the other thread *)
let result = Event.sync (Event.receive response_channel) ;;

print_endline (string_of_int result) ;;
```

Using this we can retrieve the return value of the thread. Note that we can only send one value through the channel.
