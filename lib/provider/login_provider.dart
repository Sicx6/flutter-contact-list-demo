import 'package:flutter/material.dart';
import 'package:flutter_interview_demo/screens/contact_screen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool passwordVisible = true.obs;

  @override
  void onInit() {
    passwordVisible;
    super.onInit();
  }

  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  void handleLogin(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      String enteredUsername = usernameController.text;
      String enteredPassword = passwordController.text;

      print('$enteredPassword, $enteredUsername');

      // Example validation logic
      if (enteredUsername.isNotEmpty && enteredPassword.isNotEmpty) {
        Get.offAll(() => ContactScreen());
      }
    }
  }

  void togglePasswordVisibility() {
    passwordVisible.toggle();
    // passwordVisible.value = !passwordVisible.value;
  }
}
