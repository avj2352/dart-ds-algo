# Content Overview

- What is Dart ?

- Type safety

- Soundness

- Type inference

- Null safety

- Dart compilers

```dart
void main() {
  for (int i = 0; i < 5; i++) {
    print('hello ${i + 1}');
    print('Hello Dart - Pramod');
  }
}
```

---

# What is Dart ?

- Dart is a type safe language -
  
  - Types are mandatory in Dart
  
  - Dart can also infer types
  
  - The only operations that can be performed on data of the language are those allowed by the type of the data
  
  - Dart sound type system = Static type check (by compiler) + Runtime check
  
  - Dart allows you to write dynamic code
    
    - using the keyword - **dynamic**
  
  - whenever you use the "dynamic" type, the static analyser won't care about the variable anymore

## "dynamic" versus "var" keyword in Dart

- Dart allows you to write dynamic code

- using the keyword - **dynamic**

- whenever you use the "**dynamic**" type, the static analyser won't care about the variable anymore

- Dart can also infer types - by using the "**var**" keyword

- for the rest of it's life, it is always of the type since it's inference

- Dart will check for "**var**" during compile time

- Once again, if you want the type to be checked on runtime - "**dynamic**"

```dart
// *A value of type 'double' can't be assigned to a variable of type 'String'.
void main() {
  dynamic name = 'pramod';
  name = 1;
  var anotherName = 'shwetha';
  print ('Name is: ${name}');
  print ('Type of name is ${name.runtimeType}'); // int
  print ('Another name: ${anotherName}');
  print ('Type of anotherName is: ${anotherName.runtimeType}'); // String
  anotherName = 2.0; //error* - anotherName is inferred as String already
  print ('Type of anotherName is: ${anotherName.runtimeType}');
}
```

## what happens is Dart is not aware of the value of a variable at compile time?

If we declare a variable using the **var **keyword and don't assign a value

```dart
var a; // dart doesn't have a clue on what type of variable this is
```

The Dart analyzer will play it safe and change it's datatype to **dynamic** 

```dart
dynamic a; // dart analyzer will delegate it to dart runtime
```

and if the value of a is still unknown at runtime then the Dart runtime it's of type Null

```dart
Null a; // this is not good practice
```

## Null Safety

- Dart recently introduced Sound Null safety

- what it generally means - *Values can't be null, unless you say them to be*

- Null type objects are checked at both Static checks and Runtime checks

- What it basically means is throughout the lifecycle of Dart, a variable can EITHER be Null or Non-null, but never BOTH

---

# Dart Compilation

- Dart compile compiles Dart source code to - Intermediate languages / machine code

- for CPU architectures - ARM32, ARM64, X86_64
  
  - JIT - Just Intime Compiler
  
  - AOT - Ahead of Time Compiler

- For web applications
  
  - dartdevc - Dart development compiler
  
  - dart2js - Dart to Javascript

## JIT - Just Intime Compiler

Compiles the code it needs, only compiles the modified the code needed

- Hot deployment

- For development purposes

- Not the best, nor the most optimal

- JIT does not transform the Dart code into Machine code

- It compiles into an Intermediary Language for faster development cycles

- run by Dart VM only

When used in Production, the customer (user) doesn't care about the JIT features, - like fast testing, debugging, or hot-reload. all they care about us for the app to start and run as fast as it can on their devices

## AOT - Ahead of Time Compiler

Compiles the entire codebase into machine code, supported by the native device it's deployed on

- Ahead of time

- AOT compiles the code into platform specific machine code

- AOT makes sure the build is the best most optimal version of it

## www - For Web Development

- For Developing on web platforms - dartdevc (Dart dev compiler)

- For Production phase - Dart to Javascript Compiler

## Setup project using CLI

To start a simple command line project using Dart SDK, run the following in your terminal

```bash
dart create -t console-full name-of-the-project
```

This will create the following folder structure

- /name-of-the-project
  
  - .dart_tool
    
    - package_config.json
  
  - bin
    
    - name-of-the-project.dart
  
  - lib
    
    - name-of-the-project.dart
  
  - test
    
    - name-of-the-project_test.dart
  
  - .gitignore
  
  - .packages
  
  - analysis_options.yaml
  
  - CHANGELOG.md
  
  - pubspec.yaml
  
  - README.md

---

# First Simple Dart Program

The following prints - Hello World, includes a module from lib folder & prints the numbers separated by space

```dart
import 'package:excercise/excercise.dart' as excercise;

void main(List<String> arguments) {
	print('Hello world: ${excercise.calculate()}!');
	try {
		int result = arguments.fold<int>(0, (prev, el)=>prev + int.parse(el));
		print('Argument sum is ${result}');
	} catch (err) {
		print('Atleast one argument of type int is required');
	}
}
```

## Dart Dev Tools plugin

In order to activate dart dev tools, run the following dart command

```bash
dart pub global activate devtools
```

### For Mac

For Mac users, you need to add the following line into your **.bashrc** file

```bash
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

In order to add it use vim, nvim

```bash
nvim ~/.bashrc
```

### For Windows

For Windows users, you need to add the following to your **PATH** env variable

```bash
~\AppData\Local\Pub\Cache\bin
```

### Debugging using Devtools

In order to execute the program using devtools, run the following dart command

```bash
dart run --observe --pause-isolates-on-start
```

Inorder to open devtools on your browser run the following dart command

```bash
devtools
```

# Dart Optional Named and Positional Parameters for functions and methods

Apart from parameters that are required, functions or methods in Dart can also 
specify optional parameters.

- These come in two flavors, `positioning` and `named`.

## Positional Optional Parameters

> NOTE: since they're positional, the order in which you invoke the params matters!

```dart

// main
void main() {
  yell('Hello, World');
  yell('Hello, World', true);
  yell('Hello, World', true, '🙀');
}

// optional positional param
yell(String str, [bool exclaim]) {
  var result = str.toUpperCase();
  if (exclaim) result += '!!!';
  if (emoji.isNotEmpty) result += emoji;
  print(result);


// optional positional param with a default
yell(String str, [bool exclaim, String emoji = '']) {
  var result = str.toUpperCase();
  if (exclaim) result += '!!!';
  if (emoji.isNotEmpty) result += emoji;
  print(result);
}

```

## Named Optional Parameters

> NOTE: since you explicitly call the variable name with a key, the order doesn't matter!

```dart
// main
void main() {
  yell('Hello, World');
  yell('Hello, World', exclaim: true);
  yell('Hello, World', emoji: '🙀');
}

// optional named param
yell(String str, {bool exclaim}) {
  var result = str.toUpperCase();
  if (exclaim) result += '!!!';
  if (emoji.isNotEmpty) result += emoji;
  print(result);


// optional positional param with a default
yell(String str, {bool exclaim = false, String emoji = ''}) {
  var result = str.toUpperCase();
  if (exclaim) result += '!!!';
  if (emoji.isNotEmpty) result += emoji;
  print(result);
}

```






