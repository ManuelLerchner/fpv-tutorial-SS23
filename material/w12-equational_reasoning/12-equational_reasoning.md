# Week 12: Equational Reasoning

Equational reasoning is a powerful technique for proving properties of programs. We mostly use it to verify that a function behaves as expected, the main idea is to repeatedly substitute equal expressions and to perform simplifications until we show that the result is the expected one.
We often do this by performing induction on the structure of the input.

An important aspect to note is that if a function has an auxiliary variable. For example:

```ocaml
let rec fact_aux n acc =
  if n = 0 then acc
  else fact_aux (n - 1) (n * acc)

let fact_iter n = fact_aux n 1
```

During the induction step it is often necessary to prove a generalized version of the function for the proof to go through. In this case we would need to prove that `fact_aux n acc = acc * fact n`.

```ocaml
let fact_aux n acc = acc * fact n
```

## Example: Prove that `fact n = n * fact (n - 1)`

Let fact be defined as:

```ocaml
let rec fact n = match n with 0 -> 1
  | n -> n * fact (n - 1)
```

```ocaml
We want to prove that:
     fact_iter n = n * fact n
Which corresponds to:
     fact_aux n 1 = n * fact n

As mentioned before, we need to prove a generalized version of the function:
     fact_aux n acc = acc * fact n

Proof of the generalized version:

Base case n = 0:
            fact_aux 0 acc 
(fact_aux)  = if 0 = 0 then acc else fact_aux (0 - 1) (0 * acc)
(match)     = acc
(arith)     = acc
(match)     = acc * 1
(fact)      = acc * (match 0 with 0 -> 1 | n -> n * fact (n - 1))
            = acc * fact 0


Induction step n+1: (IH: fact_aux n acc = acc * fact n)
            fact_aux (n+1) acc
(fact_aux)  = if (n+1) = 0 then acc else fact_aux ((n+1) - 1) ((n+1) * acc)
(match)     = fact_aux ((n+1) - 1) ((n+1) * acc)
(arith)     = fact_aux n ((n+1) * acc)
(IH)        = (n+1) * acc * fact n
(arith)     = (n+1) * acc * fact ((n+1) - 1)
(match)     = acc * ((n+1) * fact ((n+1) - 1))
(fact)      = acc * (match n+1 with 0 -> 1 | n -> n * fact (n - 1))
            = acc * fact (n+1)
```

The proof of the generalized version is complete, this means that:

```ocaml
fact_aux n acc = acc * fact n
```

To proof the original statement we need instantiate the generalized version with `acc = 1`:

```ocaml
            fact_aux n 1 
(#)         = 1 * fact n
(arith)     = fact n
```

Which completes the proof. We can be sure that `fact n = n * fact (n - 1)` and that the helper function `fact_aux` is correct.
