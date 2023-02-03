import 'package:code_factory_1/screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: applyThemeData(),
      home: const HomeScreen(),
    );
  }

  ThemeData applyThemeData() {
    return ThemeData(
      fontFamily: 'sunflower',
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 80, fontFamily: 'parisienne', color: Colors.white),
        displayMedium: TextStyle(fontSize: 30, color: Colors.white),
        displaySmall: TextStyle(color: Colors.white, fontSize: 20),
        headlineMedium: TextStyle(
            color: Colors.white, fontSize: 50, fontWeight: FontWeight.w700),
      ),
    );
  }
}
