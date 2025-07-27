import 'package:hive/hive.dart';
import '../models/contact.dart';

class HiveService {
  static final Box<Contact> _box = Hive.box<Contact>('contacts');

  static List<Contact> getContacts() => _box.values.toList();

  static void addContact(Contact contact) {
    _box.add(contact);
  }

  static void updateContact(Contact contact, String name, String phone) {
    contact.name = name;
    contact.phone = phone;
    contact.save();
  }

  static void deleteContact(Contact contact) {
    contact.delete();
  }
}
