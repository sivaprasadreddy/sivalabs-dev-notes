# TypeScript Tutorial

## Installation:

`npm install -g typescript`

#### HelloWorld

**hello.ts**

```
function greeter(person) {
    return "Hello, " + person;
}

let user = "Jane User";

document.body.textContent = greeter(user);
```

Compile : `tsc greeter.ts` 

```
let hello = "Hello!";
let isDone: boolean = false;
let color: string = "blue";
let age: number = 37;
let sentence: string = `Hello, my name is ${ fullName }. I'll be ${ age + 1 } years old next month.`;
let list: number[] = [1, 2, 3];
let list: Array<number> = [1, 2, 3];

const numLivesForCat = 9;

let input = [1, 2];
let [first, second] = input;
```