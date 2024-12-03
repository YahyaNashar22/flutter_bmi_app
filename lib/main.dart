import 'package:bmi_app/Home.dart';
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
      title: 'BMI App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF1C1C1E),
        appBarTheme: const AppBarTheme(
            elevation: 8.0, backgroundColor: Colors.teal, centerTitle: true),
        iconTheme: const IconThemeData(color: Colors.white, size: 90),
        textTheme: const TextTheme(
          headlineLarge:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          headlineMedium:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
