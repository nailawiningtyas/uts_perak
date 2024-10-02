import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'contact_controller.dart';
import 'add_contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Contact List GetX',
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final ContactController contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: Obx(() => ListView.builder(
            itemCount: contactController.contacts.length,
            itemBuilder: (context, index) {
              final contact = contactController.contacts[index];
              return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.phone),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    contactController.removeContact(index);
                  },
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddContactScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
