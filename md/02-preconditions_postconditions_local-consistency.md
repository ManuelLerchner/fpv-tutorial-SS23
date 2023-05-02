# Week 2: Preconditions, Postconditions and Local Consistency

## Weakest Preconditions

Weakest Preconditions are used calculate the minimum requirements, which need to hold bevore an assignment, so that a given Assertion after the assignment holds.

Its written as:

$$
\bf{WP}[[s]](e)
$$

Where $s$ is a statement and $e$ is an assertion.

### Example

Consider the following program:

```java
void main() {
    var r = 5;
    assert(A);
    var t = 3*r;
    assert(t>=0);
}
```

We want to find the minimal requirements which need to hold at `assert(A)` so that `assert(t>=0)` holds after `var t = 3*r;`.

We can calculate this using the following formula:

$$
\begin{aligned}
& \bf{WP}[[t = 3*r]](t \geq 0) \\
\equiv\ & 3*r \geq 0 \\
\equiv\ & r \geq 0\ =: A
\end{aligned}
$$

Now we know, that for the assertion `t>=0` to hold after `var t = 3*r;`, the assertion `r>=0` needs to hold before `var t = 3*r;`.

## Local Consistency

Two assertions $A$ and $B$ are locally consistent, if $A$ is **stronger** than the **weakest precondition** of $B$. This is written as:

$$
A \implies \bf{WP}[[s]](B)
$$

>Note that it is not required that $A= \bf{WP}[[s]](B)$. Because a stronger assertion than required is also fine.

Local consistency is important: It mathematically proves that whenever the assertion $A$ holds, then the assertion $B$ holds after the statement $s$. This can be used to prove that a program actually computes what it is supposed to compute.

### Example Local Consistency

Consider the following program:

```java
void main() {
    var x = 30;
    assert(x>25); //A
    x=x+5;
    assert(x!=0); //B
}
```

$$
\begin{aligned}
&A \equiv x>25 \\
&B \equiv x \neq 0 \\
&s \equiv x=x+5\\
\end{aligned}
$$

At the moment all the Assertions are arbitrary, and there is no garantee that they actually hold during the execution of the program.

To prove them, we need to:

1. Show that all the assertions are locally consistent
2. We arrive at $true$ at the start of the program

#### Local Consistency of $A$ and $B$

We can calculate the weakest precondition of $B$ and $s$ as follows:

$$
\begin{aligned}
&\bf{WP}[[s]](B) \\
\equiv\ &\bf{WP}[[x=x+5]](x \neq 0) \\
\equiv\ & x+5 \neq 0 \\
\equiv\ & x \neq -5 \ =: B'\\
\end{aligned}
$$

We can check the local consistency of $A$ and $B$ by checking if $A \implies B'$ holds.

This is the case, because:

$$
\begin{aligned}
& A \implies B' \\
\equiv\ &  x>25 \implies x \neq -5\\
\equiv\ & true\\
\end{aligned}
$$

So we proved that $A$ and $B$ are locally consistent. This means that whenever $A$ holds, then $B$ holds after the statement $s$.

#### Weakest Precondition of $A$

If we compute the weakest precondition of $A$ and `x=30;` we get:

$$
\begin{aligned}
&\bf{WP}[[x=30]](x>25) \\
\equiv\ & 30>25 \\
\equiv\ & true =: A'\\
\end{aligned}
$$

This is obviously also locally consistent, because $true \implies A' \equiv true \implies true \equiv true$.

Since we arrived at $true$, we know that the whole chain of assertions from the start to the end of the program holds and is locally consistent.

This means that we proved that when the assertion at the start (aka. $true$) holds,then the assertion $A$ and consequently Assertion $B$ holds.

In this case, we proved that in all instances of the program, the variable $x$ cannot be $0$ at the end.
