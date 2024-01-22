# Notes

## Abstract

So, you and your company have decided to use Flutter for your next project. Maybe you've already been using Flutter for a while, but you're looking to improve your workflow. You've heard about the benefits of using a common UI library and Figma designs, but aren't sure what this means. CI/CD and testing are also on your mind, but you're not sure how to get started. And why is everyone talking about state management all the time?

This talk will cover various topics that give you and your team the knowledge and tools you need to increase your productivity and build better apps. We'll talk about how to build packages and reusable components, how designers can best deliver their work to developers, how to set up CI/CD and testing pipelines, and how to choose the right state management solution for your project.

### Topics

- Flutter
- UI Design
- State Management
- Testing and CI/CD

## Outline

### Introduction

- Who am I?
- Who is this talk for?

### Flutter

// TODO

### UI Design

- UI designers already (hopefully) use tools like Figma and Zeplin.
- There are ways your designers can deliver their work to developers that make it easier for them to build apps.

#### Figma and Tooling

- Delivering screenshots is not enough for various reasons.
  - No accurate measurements.
  - Hard to edit after the fact.
  - Hard for devs to inspect and copy values like colors, fonts, and measurements.
  - Not interactive

#### Adhere to standard design principles

- Use standard design principles.
- Aside from this being good practice from a UX perspective, it also makes it easier for devs to implement your designs.
- Examples:
  - Consistent spacing
  - Consistent font sizes
  - Consistent colors
  - Use of pre-existing components
  - Consistent use of components, and using them what they're meant for

#### Custom component library

On the designer's side:

- You will most likely want a custom look for your app that fits your brand and corporate identity.
- Creating a custom component library is a great way to achieve this.
- Create easily reusable components that can be used throughout your app.
- Think of:
  - Text fields and headers
  - Buttons
  - Cards
  - Lists
- Use these components throughout your designs, and use them for consistent purposes.

On the developer's side:

- Create a Flutter package that contains these components. This is better for:
  - Reducing the mental overhead of developers when working on these components.
  - Reusability across projects.
  - Testing in isolation.
- Use the fact you have access to the exact measurements, colors and fonts to create pixel-perfect components according to the design specs.
- Use Flutter's `ThemeData` and `BuildContext` system to your advantage. It's there for a reason. Specifically;
- To implement these widgets, try the following:
  - Simply use a theme to set colors and fonts.
    - You can of course achieve a lot by setting a primary color and a font family.
    - Set colors for different parts by using the `colorScheme` property, such as a `secondary` color, a `surface` color, and an `onSurface` color.
    - Set certain elevation values and corner radii for different parts by using the `elevation` and `shape` properties.
    - Create a custom theme class that only contains values that are important for your app, then generate a `ThemeData` object from it.
      - This also allows you to easily define multiple themes and even allow users to define custom themes according to your specs.
- If that doesn't work, create a custom widget composed of other widgets.
  - Continue to use Flutter's `ThemeData` as much as possible for the best compatibility and future-proofing.
  - Use your custom theme class to set the general properties for these components.
    - This allows for more consistent components (by keeping the code DRY) and easier editing of the theme both ahead of time and while the app is running.
    - This also still allows for custom themes by users and, indeed, the app itself.
- If all these don't meet your needs, you can always build a custom widget from scratch.
  - This is not recommended, but it's always an option.
  - Still use Flutter's `ThemeData` class and your own theme class as much as possible.
  - Make sure your widgets are performant and don't cause unnecessary rebuilds.
- Pro-tip: when defining arguments for your widget that are related to visual information and content (such as text and icons), always use the Widget class instead of Strings and IconData.
  - This allows for your widget to be used in many more ways, such as with custom icons and text widgets.
  - There are little to no downsides to doing this.
  - It avoids the need to refactor the widget later if you need to add more functionality to it.
  - It also avoids parameter hell, where you have to pass a lot of parameters to a widget that are all related to the same thing and could be achieved by simply providing a single widget.

#### Custom icons

- Make a custom icon font or use a package and add your own SVGs.
- This is a good idea for the same reasons as a custom component library.

#### Text Styling

- Designers generally already use a pre-defined set of fonts and font sizes.
- These fonts and sizes are given names that are used throughout the designs, such as header 1, body, and caption.
- Flutter already has a system for this: the `TextTheme` class.
- It contains a pre-defined set of text style slots that can be used throughout the app, and is natively supported and already used by all of Flutter's built-in widgets.
- These text styles are:
  - `headline1`
  - `headline2`
  - `headline3`
  - `headline4`
  - `headline5`
  - `headline6`
  - `subtitle1`
  - `subtitle2`
  - `body1`
  - `body2`
  - `button`
  - `caption`
  - `overline`
- To make the Flutter developers' lives easier, I advise designers to use these text styles (or a subset of them) in their designs.
- This allows the devs to use existing classes that are already supported throughout the framework.
- All of Flutter's built-in widgets will comply with these text styles, completely for free!

#### Colors

- Designers generally already use a pre-defined set of colors.
- These colors are given names that are used throughout the designs, such as primary, secondary, and surface.
- Flutter already has a system for this: the `ColorScheme` class.
- Flutter developers should use this class as much as possible.
- I highly recommend also creating a custom colors class (like `AppColors`) that contains all the color constants used throughout the app.
- This allows for easy editing of the colors and keeps them consistent.
- This also makes it easier for developers to design according to the specs -- if a design uses the color called `green`, simply use `AppColors.green` in the code.
- One potential pitfall is when supporting multiple themes.
  - References to constant colors will create problems when users want to use a different theme.
  - These themes should display different colors, and these may even have different brightnesses, for example, when a user wants to use a dark theme.
  - To solve this, create a custom class that contains all the defined color names you want.
  - Then, depending on the currently selected theme, generate a color scheme using these colors.
    - For example, if your app colorizes particular header texts, define a `header` color in your custom color class.
    - Set that color's value depending on the currently selected theme (for example, `header: AppColors.green` in a green light mode theme).

#### UI Gallery

- UI galleries are a great tool for developers and designers alike.
- These are applications that showcase a UI library and all of its features and components.
- Developers build this application and maintain it as they work on building the UI library.
  - This is also a great way to immediately test your application in multiple environments, themes, screen sizes and orientations.
- Designers can use this application to see what components are available and how they look.
  - They can also check if the components are used correctly and designed according to the specs.

### CI/CD

- CI/CD is a great way to automate your workflow and make sure your code is always in a working state.
- While not only useful to run tests your dev team wrote (or should have written), it's also a great way to automate the publishing of your app.

#### Private builds

- For example, you can set up a continuous deployment pipeline that automatically builds and publishes your app to a private distribution platform like Firebase App Distribution.
- This allows your designers to try out new features and designs and give feedback quickly and easily.

#### Public builds

- Of course, you can also set up a continuous deployment pipeline that automatically builds and publishes your app to a public distribution platform like Google Play or the App Store.
- This saves a lot of time and effort, and allows you to publish new versions of your app more frequently.
- At Bloom, we use GitLab's CI/CD system to run automated tests to ensure a degree of quality before our code is published into our general codebase.
- Then, we use Codemagic CI/CD to automatically build and deploy these apps to the Google Play Store and the Apple App Store with the push of a button.
- This saves time and effort, and allows us to publish new versions of our app more frequently.
- It's also less error-prone, as it's easy to forget to update the version number or to forget to build a release version of the app.
- One thing that's often overlooked is the decrease in mental overhead and context-switching that this saves, allowing developers and project managers to do more of what they're good at.

### State Management

- State management is a hot topic in the Flutter community.
- There are many different solutions, and it's hard to choose the right one for your project.
- There is no one-size-fits-all solution, but there are some guidelines that can help you make the right choice.
- To find what's right for you, keep in mind:
  - Familiarity: what are you and your team familiar with? This will help you get up to speed quickly.
  - Simplicity: what is the simplest solution that will work for your project? Don't overcomplicate things.
  - Scalability: will this solution work for your project in the long run? Will it be easy to add new features and refactor existing ones?
  - Performance: will this solution be performant enough for your project? Will it cause unnecessary rebuilds?
  - Testability: will this solution be easy to test? Will it be easy to write unit tests for your business logic?
  - Community: is this solution well-known and well-supported? Will you be able to find help when you need it?
  - Documentation: is this solution well-documented? Will you be able to find the information you need when you need it?
- Some solutions that are popular are Provider, Bloc, MobX, and Riverpod.
- Keep in mind that, if a simple ChangeNotifier is enough for your project, you don't need to use a more complex solution.
- At Bloom, we use Blocs in combinations with Providers and a repository pattern.
- We've found this architecture to be very scalable, easy to test, easy to understand and build a mental model of, and relatively fast to implement.
- Whatever you do, consistency is key. Pick a solution and stick to it.
  - If what you're doing doesn't work, go back to the drawing board and try something else.
  - Once you've found a new solution, make sure to deploy it consistently throughout your project and make changes wherever necessary to keep this consistency.
  - Update your documentation and learning resources, and make sure everyone on your team is on the same page and their knowledge is up to date.
