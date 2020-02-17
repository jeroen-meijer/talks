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
      // If the user has an image url, show the contact's image on the left.
      // Otherwise, show their initials.
      leading: contact.imageUrl?.isNotEmpty ?? false
          ? CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(contact.imageUrl),
            )
          : CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Text(
                // Takes the first letter of every word in their name, joins them and
                // makes it uppercase.
                contact.name.split(' ').map((name) => name[0]).join().toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
      // We want to display multiple items next to each other.
      // We'll use a row for this.
      title: Row(
        children: <Widget>[
          // In this example, Dart's 'collection if' syntax (introduced in Dart 2.3)
          // to easily map all the contacts to a widget, but we could have also used
          // ternary operators (X ? A : B), but this makes the code more readable.
          //
          // If the birthdate is known, show it next to the name.
          if (contact.birthdate == null)
            Text(contact.name)
          else
            Text('${contact.name} (${contact.ageInYears})'),

          // If it's this person's birthday, show a cake next to their name.
          if (contact.birthdayIsToday)
            // 'Icons' is a collection of Material themed icons provided by the
            // 'flutter:material' package.
            Icon(Icons.cake)
        ],
      ),
      // If the email address is null or empty, don't display it.
      // If it isn't, display it.
      //
      // This is shorthand syntax and means the same as
      //   contact.email == null || contact.email.isEmpty
      // If contact.email is null, 'contact.email?.isEmpty' will be
      // null as well. In that case, we make the statement 'true',
      // so nothing will be displayed.
      subtitle: contact.email?.isEmpty ?? true
          ? null
          : Text(
              contact.email,
              maxLines: 2,
            ),
    );
  }

  // These auto-generated properties make sure all properties of an instance
  // of this class are displayed while debugging, for example when an exception
  // occurs involving this widget.
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Contact>('contact', contact));
  }
}
