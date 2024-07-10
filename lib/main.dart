import 'package:flutter/material.dart';
import 'package:flutter_trivia/trivia/screens/home_screen.dart';
import 'package:translator/translator.dart';

void main() {
  //testingGoogleTranslate();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const HomeScreen(),
    );
  }
}

testingGoogleTranslate() {
  GoogleTranslator translator = GoogleTranslator();
  translator
      .translate(
    "Hello World",
    from: "en",
    to: "pt",
  )
      .then(
    (translation) {
      print(translation.text);
    },
  );
}
