import 'package:flutter/material.dart';
import 'package:flutter_machine_test_mobile_app/pages/home_page.dart';
import 'package:flutter_machine_test_mobile_app/pages/login.dart';
import 'package:flutter_machine_test_mobile_app/pages/otp-verification.dart';
import 'package:flutter_machine_test_mobile_app/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Machine test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const Login(),
        '/otp-verification' : (context) => OTPVerification(),
        '/home' : (context) => HomePage()
      },
    );
  }
}
