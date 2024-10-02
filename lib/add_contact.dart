import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'contact_controller.dart';

class AddContactScreen extends StatelessWidget {
  final ContactController contactController = Get.find<ContactController>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    phoneController.text.isNotEmpty) {
                  contactController.addContact(
                      nameController.text, phoneController.text);
                  // Navigasi kembali ke halaman utama
                  Get.back();
                }
              },
              child: Text('Add Contact'),
            ),
          ],
        ),
      ),
    );
  }
}
