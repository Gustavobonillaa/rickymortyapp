import 'package:flutter/material.dart';
import 'package:proyecto_2/screens/home_page.dart';
import 'package:proyecto_2/screens/login.dart';
import 'package:proyecto_2/widgets/main_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Login(),
    );
  }
}

