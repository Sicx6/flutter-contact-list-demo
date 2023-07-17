import 'package:flutter/material.dart';
import 'package:flutter_interview_demo/const/global_var.dart';
import 'package:flutter_interview_demo/provider/login_provider.dart';
import 'package:flutter_interview_demo/screens/contact_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LoginController _loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: kGradient,
        ),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: height * 0.12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    'lib/images/Logo.png',
                    height: 300,
                    width: 300,
                  ),
                ),
                SizedBox(height: height * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Welcome to IngLab',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Please enter your details to continue',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: _loginController.usernameController,
                        validator: _loginController.validateUsername,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Username',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          border:
                              InputBorder.none, // Remove the border property
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                    () => SizedBox(
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: TextFormField(
                          controller: _loginController.passwordController,
                          validator: _loginController.validatePassword,
                          obscureText: _loginController.passwordVisible.value,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            suffixIcon: IconButton(
                              onPressed:
                                  _loginController.togglePasswordVisibility,
                              icon: Icon(
                                _loginController.passwordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot password?'),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kLoginButton,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Set the desired border radius
                      ),
                    ),
                    onPressed: () => _loginController.handleLogin(_formKey),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
