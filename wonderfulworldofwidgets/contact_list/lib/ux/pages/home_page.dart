import 'dart:io';

import 'package:contact_list/backend/api.dart';
import 'package:contact_list/backend/models.dart';
import 'package:contact_list/ux/widgets/contact_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// This widget is the home page of the application.
class HomePage extends StatelessWidget {
  /// This is the constructor for the HomePage class.
  /// The `{ ... }` contain the parameters. By default, these are optional.
  /// The given `Key` object is (and should usually always be)
  /// passed to the parent class.
  /// The [this.title] is syntactic sugar for setting an instance value.
  ///
  /// The 'const' keyword ensures that we can make const instantiations
  /// of this class.
  const HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  /// The title for our application, shown in the AppBar.
  final String title;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time this widget is built.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the HomePage object that was created by
        // the ContactListApp.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: FutureBuilder<List<Contact>>(
        // The Future we want to fetch.
        future: Api.fetchContacts(),
        // This method is called every time the state of the Future changes.
        builder: (context, snapshot) {
          // If there's an error, return an error message.
          if (snapshot.hasError) {
            return Center(
              child: Text(
                // We can concatenate strings simply by following a string
                // by another string.
                'An error has occurred while fetching contacts.\n'
                'Please try again later.\n'
                '\n'
                // String interpolation in Dart is super easy!
                'Error: ${snapshot.error}',
                // TextAlign.center ensures that every line is centered
                // horizontally.
                textAlign: TextAlign.center,
                // Let's add some styling.
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            );
          }

          // If there's no error but we don't have data either, show an
          // animated loading indicator.
          if (!snapshot.hasData) {
            // We can return a different widget depending on the platform
            // we're running on. We can do so by using the Platform class from
            // Dart's 'dart:io' package.
            //
            // On iOS and macOS, we use the CupertinoActivityIndicator.
            // On any other platform, we use the CircularProgressIndicator.
            return Center(
              child: Platform.isIOS || Platform.isMacOS
                  ? const CupertinoActivityIndicator()
                  : const CircularProgressIndicator(),
            );
          }

          // If there's no error and we do have data, display it.

          // Unpack the data. This variable has the type List<Contact>
          // which is exactly what we need.
          final contacts = snapshot.data;

          return ListView(
            // ListView takes in multiple children and allows us to
            // scroll between all of them. By default, ListView will
            // lay out its children vertically.
            // In this example, Dart's 'collection for' syntax (introduced in Dart 2.3)
            // to easily map all the contacts to a widget, but we could have also used the
            // .map(...).toList() functions on the 'contacts' variable.
            children: <Widget>[
              // For each contact in the 'contacts' variable...
              for (final contact in contacts)
                // we create a ContactInfo widget and pass it the contact.
                ContactInfo(contact: contact),
            ],
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // These auto-generated properties make sure all properties of an instance
  // of this class are displayed while debugging, for example when an exception
  // occurs involving this widget.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('title', title));
  }
}
