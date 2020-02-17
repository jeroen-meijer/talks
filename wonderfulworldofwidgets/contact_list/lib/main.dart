import 'package:contact_list/ux/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(ContactListApp());

class ContactListApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact List Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a red toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      // Using 'const' when instantiating classes improves performance,
      // because the resulting object will be generated at compile time
      // rather than at runtime.
      home: const HomePage(title: 'Contact List Demo'),
    );
  }
}
