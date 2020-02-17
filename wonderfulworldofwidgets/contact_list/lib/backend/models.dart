import 'package:meta/meta.dart';

class Contact {
  /// The constructor for the Contact class.
  ///
  /// We use the optional named parameter syntax for
  /// readability, but use @required for all fields that
  /// cannot be omitted.
  const Contact({
    @required this.name,
    this.email,
    this.birthdate,
    this.imageUrl,
  });

  final String name;
  final String email;
  final DateTime birthdate;
  final String imageUrl;

  /// This is a getter, a calculated property.
  bool get birthdayIsToday {
    // If there is no birthdate data, return false.
    if (birthdate == null) {
      return false;
    }

    // Get today's date.
    final now = DateTime.now();

    // If today's date and the birthdate are equal, then today
    // is this contact's birthday.
    return now.month == birthdate.month && now.day == birthdate.day;
  }

  /// Another getter that provides the current age in years.
  int get ageInYears => birthdate == null ? null : (birthdate.difference(DateTime.now()).abs().inDays / 365).floor();

  /// Overriding the toString method makes debugging easier.
  @override
  String toString() {
    return 'Contact <name: $name, email: $email, birthdate: $birthdate, imageUrl: $imageUrl>';
  }
}
