import 'package:get/get.dart';
import 'contact_model.dart';

class ContactController extends GetxController {
  var contacts = <ContactModel>[].obs;

  void addContact(String name, String phone) {
    contacts.add(ContactModel(name: name, phone: phone));
  }

  void removeContact(int index) {
    contacts.removeAt(index);
  }
}
