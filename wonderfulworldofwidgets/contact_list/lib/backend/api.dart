import 'package:contact_list/backend/mock.dart';
import 'package:contact_list/backend/models.dart';

class Api {
  /// Imitates an async function that fetches contacts from an
  /// external API, for example, an HTTP server that returns JSON
  /// data that needs to be retrieved asynchronously.
  /// 
  /// We eventually return a List of Contact objects, but
  /// since we don't know if or when this data arrives,
  /// we need to return a Future.
  /// 
  /// This function returns the resulting Future to the caller
  /// immediately, and the computation inside the Future is
  /// done asynchronously.
  static Future<List<Contact>> fetchContacts() async {
    // Wait for two seconds. This simulates the delay a real
    // HTTP call might encounter.
    await Future.delayed(const Duration(seconds: 2));
    // Once the delay has passed, return contacts.
    return mockContacts;
  }
}