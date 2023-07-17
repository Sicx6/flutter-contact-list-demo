import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_interview_demo/const/global_var.dart';
import 'package:flutter_interview_demo/models/contact_model.dart';
import 'package:http/http.dart' as http;

class ContactServices {
  Future<List<Contact>> fetchContacts() async {
    List<Contact> contactList = [];
    try {
      http.Response res = await http.get(Uri.parse('$uri/contacts'));

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        // Extract contacts from the response data
        List<dynamic> contactsData = data['data'];

        print(contactsData);
        contactList = contactsData.map((contactData) {
          return Contact(
            id: contactData['id'],
            name: contactData['name'],
            email: contactData['email'],
          );
        }).toList();
      } else {
        // print('Failed to fetch contacts. Status code: ${res.statusCode}');
        Get.snackbar('error',
            'Failed to fetch contacts. Status code: ${res.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error occured!', '$e');
    }

    return contactList;
  }
}
