import 'package:flutter/material.dart';

String uri = 'http://192.168.1.220:3000';

Color lightBlue = const Color(0xffE0F3F8);
Color kScaffoldBg = const Color(0xFFEEEEEE);
Color kLoginButton = const Color(0xFF0096A9);

LinearGradient kGradient = LinearGradient(
  colors: [
    const Color(0xffE0F3F8),
    const Color(0xffE0F3F8).withOpacity(0.2),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomCenter,
);
