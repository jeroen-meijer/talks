import 'package:meta/meta.dart';

class Contact {
  /// The constructor for the Contact class.
  ///
  /// We use the optional named parameter syntax for
  /// readability, but use @required for all fields that
  /// cannot be omitted.
  const Contact({
    @required this.name,
    @required this.email,
    this.birthdate,
    @required this.imageUrl,
  });

  final String name;
  final String email;
  final DateTime birthdate;
  final String imageUrl;

  /// Overriding the toString method makes debugging easier.
  @override
  String toString() {
    return 'Contact <name: $name, email: $email, birthdate: $birthdate, imageUrl: $imageUrl>';
  }
}
