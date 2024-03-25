import 'package:cydeva_application/screens/HomePage/HomePage.dart';
import 'package:cydeva_application/screens/SignInPage/OTPPage.dart';
import 'package:cydeva_application/screens/SignInPage/SuccessPage.dart';
import 'package:cydeva_application/screens/SignInPage/Welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
