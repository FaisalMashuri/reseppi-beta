

import 'package:flutter/material.dart';
import 'package:reseppi_beta/pages/account.dart';
import 'package:reseppi_beta/pages/homepage.dart';
import 'package:reseppi_beta/pages/not_found.dart';
import 'package:reseppi_beta/pages/onboarding.dart';
import 'package:reseppi_beta/pages/scan_found.dart';
import 'package:reseppi_beta/pages/scan_page.dart';
import 'package:reseppi_beta/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: {
      "/": (context) => SplashPage(),
      '/scan' : (context) => ScanPage(),
      '/404' : (context) => ResepNotFound(),
      '/home': (context) => HomePage(),
      '/account': (context) => AccountPage(),
      '/scan-found': (context) => ScanFound(),
      '/onboard':(context) => OnBoardingScreen()
    });
  }
}
