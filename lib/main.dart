import 'package:flutter/material.dart';
import 'package:flutter_trivia/themes/theme_data.dart';
import 'package:flutter_trivia/trivia/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const HomeScreen(),
    );
  }
}
