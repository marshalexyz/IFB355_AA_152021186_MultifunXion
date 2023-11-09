import 'package:flutter/material.dart';
import 'package:flutter_auth_profile/about.dart';
import 'package:flutter_auth_profile/bmi.dart';
import 'package:flutter_auth_profile/konversimatauang.dart';
import 'package:flutter_auth_profile/home.dart';
import 'package:flutter_auth_profile/konversisuhu.dart';
import 'package:flutter_auth_profile/donasi.dart';
import 'login.dart';
import 'register.dart';
import 'qris.dart';
import 'kalkulator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultifunXion',
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/calculator': (context) => Calculator(),
        '/bmi': (context) => BMICalculatorScreen(),
        '/convert': (context) => CurrencyConverterPage(),
        '/suhu': (context) => SuhuConverterPage(),
        '/about': (context) => AboutPage(),
        '/donasi': (context) => DonasiPage(),
        '/qris': (context) => QrisGoPayPage(),
      },
    );
  }
}
