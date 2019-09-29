## Flutter

- Portable UI toolkit
- Uses widgets for UI composition and layout
- Compiles to native ARM code
- Platform independent, currently support for mobile and web

## IDEs

- Multiple choices, VS Code, IntelliJ, Android Studio, any text editor
- Learn your IDE
  - Install Flutter and Dart extensions
  - Use breakpoints
  - Use hotkeys
- Use linters (explain importance)
  - Prevent inconsistent coding styles
  - Make code readable for your team
  - Make code readable for yourself
- Use Awesome Flutter Snippets
- Use Pubspec Assist

# Tooling

- `flutter run`
- `flutter devices`
- `flutter doctor`
- `flutter analyze`
- `flutter clean`

# Widgets

- They're just classes. They can do anything a class can.
- Take advantage of things classes can do:
  - Immutable
    - If your widget isn't immutable, make it stateful or refactor your UI structure.
  - Functions
    - `void _onTap() {...}`
  - Getters (not setters)
    - `List<String> get _displayedNames => this.names.take(3);`
- "There's a widget for that!"
  - Almost all 2D UI is composable from the standard material and widgets.
  - If something's missing, look for a well-maintained package.
    - Using a badly maintained package can cost more time and effort than making one yourself.
- There are multiple types of widgets.
  - Visual (Text, Image, Button)
  - Layout (List, Center, LayoutBuilder)
  - Functional (GestureDetector, StreamBuilder)

# State Management

- A lot of approaches
  - Provider
  - Get It
  - Redux (& Async Redux)
  - MobX
  - Bloc

# Backend

- Dart is g.p. lang, use any method you like for server comm.
  - http
  - grpc
  - etc.
- Http has two variants
  - For simple stuff, use `http` package (`import 'package:http/http.dart' as http;`).
  - For more fine-grain control (streams, cookies), use `HttpClient`.
- multiple patterns
- use what works for you

# Packages

- Extend functionality by importing existing code
- Can be found on pub.dev
- Are defined in `pubspec.yaml`

# Plugins

- Use existing native APIs by creating plugins
- Allows native API access
  - Dart <-> Platform
- Example
- Dart FFI



# Final Notes & Resources

- *take slides from redux talk*