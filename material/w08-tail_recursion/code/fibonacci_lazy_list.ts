type llist<T> = [T, () => llist<T>];

function fibonaccci_generator(): llist<number> {
  function fib_step(a: number, b: number): llist<number> {
    return [a, () => fib_step(b, a + b)];
  }
  return fib_step(0, 1);
}

let fibs = fibonaccci_generator();

for (let i = 0; i < 10; i++) {
  let [val, next_generator] = fibs;

  console.log(val);
  fibs = next_generator();
}

// Output:
// 0
// 1
// 1
// 2
// 3
// 5
// 8
// 13
// 21
// 34

// The generator works as follows:
// [0 1]
// 0 [1 1]
// 0 1 [1 2]
// 0 1 1 [2 3]
// 0 1 1 2 [ ... ]
