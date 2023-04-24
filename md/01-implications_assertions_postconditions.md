# Week 1: Implications, Assertions and Stronges Postconditions

## Implications

Implications are the the key for understanding FPV. They show up in topics such as *Weakest Preconditions*, *Strongest Postconditions*, *Proof by Induction / Structural Induction*...

### Definition of Implications

As you remeber from the "Diskrete Strukturen" course, an implication is a statement of the form $A \implies B$. It is read as:

+ "$A$ implies $B$"
+ "If $A$ is true, then $B$ is true"

It's syntactic sugar for the following statement:

$$
A \implies B \iff \neg A \lor B
$$

This is a very important statement, because it can be used to simplify complex statements, if you can't remember the specific rules for implications.

### Truth Table

| $A$ | $B$ | $A \implies B$ |
|:---:|:---:|:--------------:|
| T   | T   | T              |
| T   | F   | F              |
| F   | T   | T              |
| F   | F   | T              |

### Examples

Example 1:

$$
\begin{aligned}
& x = 1 \implies x \geq 0 \\
\iff & \neg (x = 1) \lor (x \geq 0) \\
\iff & (x \neq 1) \lor (x \geq 0) \\
\iff & true
\end{aligned}
$$

Example 2:

$$
\begin{aligned}
& A \implies (B \implies A) \\
\iff & \neg A \lor (B \implies A) \\
\iff & \neg A \lor (\neg B \lor A) \\
\iff & \neg A \lor A \lor \neg B \\
\iff & true \lor \neg B \\
\iff & true
\end{aligned}
$$

## Assertions

Assertions are used to **annotate** specific points in a program and to **check** if a given expression is true at that point. If the expression is false, the program will terminate.

This is usefull if you only want to allow certain values for a variable, because otherwise the program would not work as expected. They can also be used to prove the correctness of a program. Which is the main topic of this course.

### Example for MiniJava

![Flow Diagram](md/images/cfg.png)

This corresponds to the following program:

```java
void main() {
    var n = read(); //reads an arbitrary integer
    var i = 0;
    assert(A);

    var x = 0;
    assert(B)
    while (i < 10) {
        x = x + n;
        i = i + 1;
        assert(B);
    };

    write(x);
    assert(C);
}
```

The challenge is to find strong and precise assertions for the specific points in the program which allow us to prove the correctness of the program. In this case, we want to prove that the program **always** prints $n \cdot 10$ to the console.
This corresponds to Assertion $C \iff x = n \cdot 10$.

Remember that whenever the programm-flow reaches an assertion, the assertion must be true. Otherwise the program will terminate.

### Strength of Assertions

Two assertions $A$ and $B$ can have different strengths. This happens for example if assertion $A$ is more precise than assertion $B$.

For example, the assertion $A=5$ is stronger than the assertion $B=5 \lor 6$, because it is more specific. The assertion $A$ only allows the value $5$, while the assertion $B$ allows the values $5$ and $6$.

This makes sense intuitively. But in order to use it in practice, we need to define what it means for an assertion to be stronger than another assertion.

### Definition of Assertions-Strength

We say that an assertion $A$ is stronger than an assertion $B$, if $A$ implies $B$.

Using this definition, we can compare different assertions and determine if they are:

+ **Equivalent**: $A \implies B$ and $B \implies A$
+ **Ordered (eg. A is stronger)**: $A \implies B$
+ **Uncomparable**: $A \not\implies B$ and $B \not\implies A$

### Special Assertions

Remember that $true$ and $false$ are also valid assertions. They are called **tautologies** and **contradictions** respectively.

How do they fit into the strength definition?

+ **Tautologies**: $A \implies true$ for all $A$
  + This means that every assertion is stronger than $true$ thereby making $true$ the weakest assertion.
+ **Contradictions**: $false \implies A$ for all $A$
  + This means that $false$ is stronger than every assertion thereby making $false$ the strongest assertion.

In practice those assertions show up in the following cases:

+ **Tautologies**: If you have no information about the variables at a specific time in the program, you can use $true$ as an assertion to express this.
+ **Contradictions**: If you have a point that is **never** reached in the program, you can use $false$ as an assertion to express this. This means that if the programm somehow would reaches this point (which it won't), the program would terminate.

## Strongest Postconditions

The strongest postcondition of a statement $s$ and a precondition $A$ is the strongest assertion $B$ that holds after the statement $s$ has been executed.

### Example

Consider the following program:

```java
void main() {
    var i=2;
    var x=6;

    assert(x=3*i && i>=0);

    i=i+1;

    //state at this point:
    //i = 3
    //x = 6
    //since the i in the assertions refers to the old value of i, before the statement i=i+1 was executed, the assertion x=3*i is now broken (x=6 != 3*3)

    //can we find a new assertion which explicitly computes the new value of x?
    assert(C);
}
```

What is the strongest postcondition of the statement `i=i+1` and the precondition `x==3*i && i>=0`? In other words what is the strongest assertion which we can insert in the second assertion?

This can be written as:

$$
\bf{SP}[[i=i+1]](x=3*i\land i\geq 0)
$$

To compute the assertion after the statement `i=i+1` we basically need to **undo** the statement `i=i+1` because the original assertion refered to the old value of $i$, before it was updated.

We first compute the **undo** of the statement `i=i+1`:
$$
\bf{Undo}[[i=i+1]] \equiv i=i-1
$$

Then we replace the varibale $i$ (which has already gotten updated) inside the assertion with the **undo-ed** statement:

$$
\begin{aligned}
B :=\ & x=3*i\land i\geq 0 \\
\longrightarrow\ & x=3*(i-1)\land (i-1)\geq 0 \\
\equiv\ & x=3(i-1)\land i\geq 1\\
=: &\ C
\end{aligned}
$$

In total we have:

$$
\begin{aligned}
C:=\ &\bf{SP}[[i=i+1]](x=3*i\land i\geq 0)\\
\equiv& \  x=3*(i-1)\land i\geq 1
\end{aligned}
$$
