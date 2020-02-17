import 'package:contact_list/backend/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key key, this.contact}) : super(key: key);

  /// The contact data model this widget needs to display.
  final Contact contact;

  /// Callback when the widget is tapped.
  /// The underscore is not just there for flair;
  /// it makes this function private and only accessible
  /// within this file.
  void _onTap() {
    print('Tapped contact: $contact');
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // We need to pass the current BuildContext in order
      // for the above _onTap function to work.
      onTap: _onTap,
      ...
    );
  }
  
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Contact>('contact', contact));
  }
}