import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../services/hive_service.dart';

class ContactListItem extends StatelessWidget {
  final Contact contact;

  const ContactListItem({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.phone),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => HiveService.deleteContact(contact),
        ),
      ),
    );
  }
}
