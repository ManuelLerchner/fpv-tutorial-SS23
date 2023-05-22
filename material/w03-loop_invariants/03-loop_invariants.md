# Week 3: Loop Invariants

## What is a loop invariant?

A loop invariant is a assertion that holds in each iteration of a loop. Finding such a loop invariant is needed to calculate weakest preconditions for programs with loops, because the **normal** way of finding the preconditions does not work for loops.

## The Problem with Loops

Lets say you are trying to calculate the weakest precondition for the following program:

![Program with loop](material/w03-loop_invariants/images/program_with_loop.png)

The normal way of finding the weakest precondition would be to start at the end of the program and work your way backwards.

$$
\begin{aligned}
X&=\bf{WP}[write(x)](x=n!) &= x=n! \\
\\
I&=\bf{WP}[i<n](X,K) &= (i<n \land K) \lor (i \geq n \land X) \\
K&=\bf{WP}[i:=i+1](J) &= J[(i+1) / i] \\
J&=\bf{WP}[x:=x*i](I) &= I[x*i/x] \\
\end{aligned}
$$

So we came to a conclusion that in order for us to compute the weakest precondition $I$ we need to calculate $I,K$ and $J$. But $J$ itself depends on $I$ so we have a circular dependency and therefore we cannot calculate $I$ directly.

## Finding a Loop Invariant

Since we cannot directly compute loop invariants we need to find a way to come up with them indirectly.

We can do this by guessing a loop invariant $I$ that is **strong enough** to prove the correctness of the program. We do this by checking that our assertions (which are constructed using our guessed loop invariant) are locally consistent.

If we have shown local consistency we just need to check if the starting point is annotated with $true$. Then we have successfully proven the correctness of the assertion at the end of the program.

## Evaluating different Loop Invariants

For the program above a suitable loop invariant would be: $I:= x=i! \land 0<i \leq n$. But how do we come up with this loop invariant?

For this we look at some other loop invariants and evaluate them:

### Example Loop Invariants

1. $I:= x\geq 0$:
   - This loop invariant is **not strong enough** to prove the correctness of the program. Since it it fails the local consistency check. ($I\not\implies \bf{WP}[i<n](X,K)$)
   - It was obvious that this loop invariant fails, because it does not contain any precise information about the value of $x$, which is needed to prove $x=n!$.
2. $I:= i=0\land x=1 \land n=0$:
   - This loop invariant is way to strong, and is overall a bad choice because it would fail for any $n\neq 0$.
3. $I:= x=i! \land 0<i \leq n$:
   - This loop invariant is **strong enough** to prove the correctness of the program. Since it passes the local consistency check. ($I\implies \bf{WP}[i<n](X,K)$)
   - Using this loop invariant we can prove that $true$ holds at the start of the program, which means that the program and its assertions is correct.
   - Why does this loop invariant work?
     - It encapsulates all "relevant" information about the variables which change in the loop ($x$ and $i$).
     - Combined with the false-branch of the if-statement it follows that $i\leq n \land i\geq n \implies i=n$. Which is exactly what is needed to prove $x=n!$ after we exit the loop.
     - It is weak enough to not disturb the proving of $true$ at the start of the program.

## Tips for Finding a Loop Invariant

There exist some old videos from the lecture "EIDI2" from the year 2017 that explain how to find loop invariants. The video is in german and is not relevant for this years course, but it still contains some useful tips for finding loop invariants.

- [https://ttt.in.tum.de/recordings/Info2_2017_11_24-1/Info2_2017_11_24-1.mp4](https://ttt.in.tum.de/recordings/Info2_2017_11_24-1/Info2_2017_11_24-1.mp4) [Nico Hartmann 2017]
