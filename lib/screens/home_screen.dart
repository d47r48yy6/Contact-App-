import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/contact.dart';
import '../widgets/contact_form.dart';
import '../widgets/contact_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final contactBox = Hive.box<Contact>('contacts');

    return Scaffold(
      appBar: AppBar(title: const Text("Hive Contact App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search Field
            TextField(
              controller: _searchController,
              onChanged: (val) => setState(() => _searchQuery = val.toLowerCase()),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                labelText: 'Search by name...',
              ),
            ),
            const SizedBox(height: 16),
            // 📝 Contact Form
            const ContactForm(),
            const SizedBox(height: 16),
            // 📋 Contact List
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: contactBox.listenable(),
                builder: (context, Box<Contact> box, _) {
                  final contacts = box.values
                      .where((c) => c.name.toLowerCase().contains(_searchQuery))
                      .toList();

                  if (contacts.isEmpty) return const Center(child: Text("No contacts"));

                  return ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (_, i) => ContactListItem(contact: contacts[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
