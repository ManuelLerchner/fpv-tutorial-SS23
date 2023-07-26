# Week 4: Termination Proofs

## Why are Termination Proofs Necessary?

Every program containing a loop is potentially dangerous. Under the right circumstances, a loop can run forever, causing the program to hang. This is called an **infinite loop**.

In general, programs which don't eventually halt are of little use and can be considered as faulty.

For example, the following program contains an infinite loop and will never print "Finished":

```typescript
let i = 17;
let j = 5;
while (i > j){
   i += 2;
   j += 1;
}
console.log("Finished");
```

On the other hand, the following program will always halt:

```typescript
let i = 17;
let j = 5;
while (i > j){
   i += 1;
   j += 2;
}
console.log("Finished");
```

But how can we be sure that a program will always halt? In some cases it is not so obvious as in the examples above.

This is where **termination proofs** come in.

## What is a Termination Proof?

In a termination proof, you generally try to prove that a certain variable only takes on positive values inside a loop. Furthermore, you try to prove that the variable is decreased by at least one in each iteration of the loop.

This means that the variable will eventually reach zero (or less) and the cannot be entered again. Because this would violate the Assertion we defined.

But just coming up with arbitrary assertions and then claiming that they prove termination is not enough. We also need to show that those assertions are **localy consistent**.

## How to do a Termination Proof?

Bevore we can perform a termination proof, it is necessary to understand what the loop actually does.

In the second example above our intuition tells us that the loop will eventually terminate. Because the variable `j` is increased by two in each iteration, while `i` is only increased by one. This means that `j` will eventually overtake `i` and the loop will terminate.

With this understanding we can define an auxiliary variable `r` which represents this intuition.

Since we only want to prove that the loop terminates, we just need to prove $true$ at the end of the program.

In general, we need to insert the following assertions / statements

![Flowchart with auxiliary variable](./material/w04-termination/images/program_with_assertions.png)

Notice that we need both these assertions to prove termination:

+ $r > 0$ at the beginning of the loop
+ $r > r_e$ at the end of the loop, right bevore $r = r_e$

Now the task is to show the following, we have proven that the loop terminates:

+ local consistency of all assertions
+ arrived at $true$ at the start of the program
+ The special assertions $r \geq 0$ and $r > r_e$ are also localy consistent
