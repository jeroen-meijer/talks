<!--
Notes for my talk 'Testing in Flutter and Dart (for the lazy)'

This document describes the multiple sections I want to cover in my talk.
Mainly the what, why and how of testing in Flutter and Dart.
-->

# Introduction

- We all write Flutter applications
- Not all of us know how to write tests
- Some know you can test but don't know how to do it properly
- Testing is a key part of Flutter development
- In this talk I will cover the basics of testing in Flutter and Dart, as we do it at Very Good Ventures
- Also tell why and how to test
- It will be a very practical talk -- things you can use right away.
- If you're watching this online, check the time codes to skip to the parts you want to view.

## Why

- In one word: confidence.
- For code you wrote recently
  - To assert the logic you wrote works as expected.
  - It happens often enough that I write code, the test fails and it turns out I made a mistake.
  - It's a second look to see what you're doing makes sense.
  - Makes sure that, when your code does fail (which it will), the errors are handled properly.
  - Makes it easier to find bugs that would otherwise be hard to find and fix.
- For code you wrote in the past
  - It asserts code written by you or someone else works as expected
  - Can prevent bugs that are hard to find since the code was written either long ago or by someone else
  - In some scenarios, it can dig up performance issues
- For your current code in the future
  - Arguably the most important reason to write tests
  - Testing code now gives a lot of confidence that you won't break something in the future
  - Requirements change often, and code changes with it
  - Having proper tests makes it easy to change implementations later
  - That all can save you (and, more importantly, your team and company) both money and time
- Very Good Ventures (VGV) has multiple blog posts on testing

## What

- What should you test?
- Whatever you want.
- At VGV, we test whatever gives us the most value.
- Make sure your widget looks exactly according to spec.
- Make sure your complex logic executes as expected.
- Make sure your widget looks as expected in different contexts.
- Make sure your navigation and interaction works as expected.

## How

- There are multiple types of tests and different ways to test.
- There are a bunch of metrics to measure how well your code and tests work.
- In general, it's a good idea to test for output, not implementation.
- I will go over multiple aspects and methods of testing in this talk.

# In practice

## Terminology

Let's go over some common terminology first

### Test

- A block of code that performs some operation and makes assertions about the result.
- Can be very abstract and comes in many different forms.
  - There are typical tests that run logic and check its output.
  - UI-related tests that generate some image and compare it to a reference image.
  - Tests that make sure some data is in the right format.
  - Tests that assert something happened, or something was called in the right order with the right arguments.
  - Tests that assert the position of certain elements in the UI.
- A test is whatever you make of it.
- Flutter has native support for testing, and has multiple useful features that make it easier to write and run tests.
- Check your IDE for the various ways to run tests.
- Tests are meant to be readable, repeatable and easy to understand.
  - Do not aim to have short or extremely DRY tests.
  - When looking at a failing test, it needs to be clear what it is doing and why it fails.
  - Remember, this isn't production code that reaches end users, and readability is the key.

### Groups

- Groups in Dart testing allow you to group a set of tests under a common name.
- They help conceptually separate tests for different parts of your code.
- Common uses for groups are grouping tests for a specific class, method or scenario.
  - Think of a group called 'Calculator' that contains tests for the Calculator class.
  - You can have another group inside called 'add method' that contains tests for the add method.
  - If you have multiple errors when giving the add method the wrong arguments, you can group them under the same group as well.
- Groups in Dart have a special property -- when a test is run, the names of the groups and the test being run are joined together.
  - We use this to your advantage and write the tests in a way that makes it easy to find the failing test, by giving it a clear description.

### Mocks

- Extremely powerful tool in testing.
- When testing, you want to only test the particular thing the test is about.
- It should be separated from the rest of the code, and shouldn't have any external dependencies.
- Mocks are a way to create fake, static external dependencies.
- Allows you to consistently test code in a specific scenario.
  - If your backend class has a dependency on an external library, you can mock it out.
  - If your widget depends on some provider, you can mock the provider and its value.

### `expect`

- `expect` is a function that matches its first argument to the second argument.
- It's the most common function in testing.
- What each argument is or does is up to you.
  - `expect(1 + 2, equals(3))` is a test that asserts that 1 + 2 is equal to 3.

### Matchers

- Matchers are a way to assert some value or event.
- They live on the right side of the `expect` function.
- The most common matcher is the `equals` matcher, which asserts that the first argument is equal to the second.
- Their goal is to perform some assertion on a value and, if it fails, to provide a helpful error message.
- There are a lot of inlcuded matchers, and you can write your own
- _Show various useful matchers on screen, including: equals, isTrue, isFalse, isNull, contains('world'), emitsInOrder([1, 2, 3])_
- Matchers can be cleverer than they seem.
  - The `equals` matcher will check for string equality and give special errors if they are different, but it will also properly match lists and maps, for example. _Show example._
  - The `contains` matcher works on strings (`expect('Hello world', contains('world'))`) but also lists (`expect([1, 2, 3], contains(2))`) and other iterables.

### Finders

- Finders are a way to find widgets in the widget tree.
- Many different finders for various situations.
- There are matchers that can be used with finders.
  - `find.byType(MaterialApp)`
  - `find.text('Home')`
  - `find.byIcon(Icons.alarm)`
  - `find.descendant(of: myListTile, matching: myTitle)`

### WidgetTester

- A mechanism to run tests on widgets.
- Can create a widget tree and allows you to programmatically interact with it.
- Most common method is `tester.pumpWidget(widget)`
- "Pumping" means rendering a frame of the widget tree.
- Will be explained in more detail in the next section.
- You can also retrieve an instance of a widget and do assertions on it.
  - `tester.widget(find.byType(MaterialApp))`

### Code Coverage

- A metric of how much code has been executed during tests.
- Not unique to Dart, but a very useful tool for testing.
- At VGV, we aim for 100% code coverage on every project.
- Coverage, in our opinion, is a good way to measure the breadth of how much of your code is tested.
  - It doesn't mean all your code is tested.
  - It doesn't even mean any of your code is tested.
  - It means your code has executed.
  - You can write testing code that executes your entire application, but never actually assert anything.
  - However, if a particular line or method has never been run, you know for sure it can't have been tested.
  - 100% code coverage isn't the goal of how we write tests -- it's the outcome of writing tests for every path and codebranch in our application. That's why we use it as a metric.

## Types of tests

# Unit tests

- Simplest kind of test.
- Perform logic, check the output.
- For example
  - Think of a calculator. You can test it by adding, subtracting, multiplying and dividing.
  - A backend class, like a repository, that depends on some API. You can test it by mocking out the API and making sure the repository provides the right data when calling 'getUser'.
  - Or, a repository that handles errors the right way, when the API returns an error or some malformed data.

```dart
group('Calculator', () {
  // Regular example
  group('add method', () {
    test('adds given value to current value', () {
      final instance = Calculator()..add(2);

      expect(instance.currentValue, equals(2));
    });
  });

  // Error example
  group('divide method', () {
    test('throws ArgumentError when divisor is 0', () {
      final instance = Calculator();

      expect(() => instance.divide(0), throwsArgumentError);
    });
  });

  // Stream example
  test('history returns stream of updated history values', () {
    final instance = Calculator();

    expect(
      instance.history,
      emitsInOrder(<List<double>>[
        [0],
        [0, 1],
        [0, 1, 2],
        [0, 1, 2, 3],
      ]),
    );

    instance
      ..add(1)
      ..add(1)
      ..add(1);
  });
});
```

# Widget tests

- Simple way to test widgets.
- Not image comparison, but unit tests for widgets.
- Build a widget, perform some logic, check the widget tree or some output.
- For example
  - Show a home page and make sure that it displays the right text.
  - Assert that the sign in button performs the right action when pressed.
  - Display a list of cars and make sure the user navigates to the right page when a car is tapped.

```dart
testWidgets(
  'renders empty text '
  'when no cars are available',
  (tester) async {
    when(() => rentalService.cars).thenReturn([]);
    await tester.pumpWidget(buildSubject());

    expect(find.text('No cars available'), findsOneWidget);
  },
);

testWidgets(
  'navigates to CarDetailsPage '
  'when a car is tapped',
  (tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.byType(CarListTile));

      verify(() => navigator.push(any()));
    });
  },
);
```

## Other kinds

- You can do integration tests, that test the interaction between your app and an external system.
- You can do golden tests, that compare the output of your app to a golden image file.
