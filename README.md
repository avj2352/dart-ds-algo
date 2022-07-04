# Dart DS Algo

I want to start learning Dart language. So I thought - what better way than going through all the DS algo problems I've solved using Dart

Contains code snippets to understand Dart. will be covering the blind 75, neetcode, algo-monster & structy purely in dart, using it's rich programming features

I will try to document the nuances in my app - [Tech Quest](https://tiny.one/techquestapp) problems with the tag `dart` will have solutions solved using the Dart language.

- [Neetcode](./lib/neetcode)
- [Structy.net](./lib/structy)
- [Algo Monster](./lib/algo-monster)
- [Leetcode](./lib/leetcode)

## Important Links
- [Dart - egghead.io](https://egghead.io/courses/getting-started-with-dart-e1b1780f)
- [Dart youtube](https://www.youtube.com/watch?v=F3JuuYuOUK4)
- [Dart Testing - Youtube](https://www.youtube.com/watch?v=NYi1saTtP-0&t=64s)
- [Neetcode.io](https://neetcode.io)
- [Structy.net](https://structy.net)
- [Algo Monster](https://algo.monster/)
- [Leetcode](https://leetcode.com)
- [Dart Async Generators](https://zaiste.net/programming/dart/howtos/use-generators-dart/)

## FAQ Troubleshooting
- [Collections as optional arguments in Dart](https://stackoverflow.com/questions/69403241/flutterdart-cannot-remove-from-unmodifiable-list)


## Dart Async Generators

In Dart, generators are functions that **generate a sequence of values on-demand (lazy evaluation).** 

Dart's generators can be **synchronous** and **asynchronous**. 

Synchronous generators return an Iterable while asynchronous ones return a Stream. Asynchronous generators allow for asynchronous operations in their bodies (i.e. operations invoked with the await keyword), something that cannot be done in synchronous ones. 

Generators in Dart can also be used recursively.

### Synchronous Generators

- Synchronous generators return an `Iterable`

- Generators in Dart can also be used recursively.

- You can create a synchronous generator from a function using the `sync*` keyword:

```dart
Iterable<int> range(int num) sync* {
  while (num > 0) {
    yield --num;
  }
}

void main() {
  for (int value in range(10)) {
    print(value);
  }
}
```

### Asynchronous Generators

- You can create a asynchronous generator from a function using the `async*` keyword:

- Asynchronous generators allow for asynchronous operations in their bodies (i.e. operations invoked with the `await` keyword).

```dart
Stream<int> range(int num) async* {
  while (num > 0) {
    yield --num;
  }
}

void main() {
  range(10).listen((value) => print(value));
}
```
---


