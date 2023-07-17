import 'package:flutter/material.dart';
import 'package:flutter_interview_demo/const/global_var.dart';
import 'package:flutter_interview_demo/provider/contact_provider.dart';
import 'package:flutter_interview_demo/provider/login_provider.dart';
import 'package:flutter_interview_demo/screens/Login_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(ContactProvider());
    Get.put(LoginController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact Listing',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: kScaffoldBg,
        appBarTheme: const AppBarTheme(elevation: 1),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: LoginScreen(),
    );
  }
}
