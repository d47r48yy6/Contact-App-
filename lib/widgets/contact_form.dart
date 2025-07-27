import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/contact.dart';
import '../services/hive_service.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  Contact? _editingContact;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text.trim();
      final phone = _phoneController.text.trim();

      if (_editingContact == null) {
        HiveService.addContact(Contact(name: name, phone: phone));
      } else {
        HiveService.updateContact(_editingContact!, name, phone);
      }

      _clear();
    }
  }

  void _clear() {
    _nameController.clear();
    _phoneController.clear();
    setState(() => _editingContact = null);
  }

  void _edit(Contact contact) {
    _nameController.text = contact.name;
    _phoneController.text = contact.phone;
    setState(() => _editingContact = contact);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty || !RegExp(r'^\d{10}$').hasMatch(value!)
                        ? 'Enter 10-digit phone'
                        : null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _submit,
                child: Text(_editingContact == null ? 'Add' : 'Update'),
              )
            ],
          ),
        ),
      ],
    );
  }
}
