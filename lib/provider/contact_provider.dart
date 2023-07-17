import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_interview_demo/const/global_var.dart';
import 'package:flutter_interview_demo/models/contact_model.dart';
import 'package:flutter_interview_demo/services/contact_services.dart';
import 'package:get/get.dart';

class ContactProvider extends GetxController {
  RxList<Contact> contactList = <Contact>[].obs;
  RxList<Contact> searchList = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  void fetchContacts() async {
    try {
      ContactServices contactServices = ContactServices();
      List<Contact> contacts = await contactServices.fetchContacts();
      contactList.value = contacts;
      searchList.value = contacts;
    } catch (e) {
      Get.snackbar('Error', 'Error fetching contacts: $e');
    }
  }

  void filterContacts(String query) {
    if (query.isNotEmpty) {
      searchList.value = contactList
          .where((contact) =>
              contact.name.toLowerCase().contains(query.toLowerCase()) ||
              contact.email.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else {
      searchList.value = contactList; // If query is empty, show all contacts
    }
  }

  String getFirstInitialsName(Contact contact) {
    final names = contact.name.split(' ');
    if (names.isNotEmpty) {
      return names.first[0];
    } else {
      return '';
    }
  }

  String getLastInitialsName(Contact contact) {
    final names = contact.name.split(' ');
    if (names.length > 1) {
      return names.last[0];
    } else {
      return '';
    }
  }

  List<TextSpan> getHighlightedNameSpans(String name, String query) {
    List<TextSpan> spans = [];
    if (name.isNotEmpty) {
      final String lowercaseName = name.toLowerCase();
      final String lowercaseQuery = query.toLowerCase();
      final List<String> nameParts = lowercaseName.split(lowercaseQuery);

      print(nameParts);

      int index = 0;
      for (final part in nameParts) {
        if (part.isNotEmpty) {
          spans.add(TextSpan(
            text: name.substring(index, index + part.length),
          ));
          index += part.length;
        }
        if (index < name.length) {
          spans.add(TextSpan(
            text: name.substring(index, index + query.length),
            style: TextStyle(
              color: kLoginButton,
              fontWeight: FontWeight.bold,
            ),
          ));
          index += query.length;
        }
      }
    } else {
      spans.add(TextSpan(text: name));
    }
    return spans;
  }

  clearSearch(TextEditingController searchController) {
    searchController.clear();
    filterContacts('');
  }
}
