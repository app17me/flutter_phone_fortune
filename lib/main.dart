import 'package:flutter/material.dart';
import 'package:phone_fortune_flutter/pages/input_page.dart';
import 'package:phone_fortune_flutter/constants.dart';
import 'package:phone_fortune_flutter/pages/result_page.dart';

void main() {
  runApp(PhoneFortunePage());
}

class PhoneFortunePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: primaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
      },
    );
  }
}
