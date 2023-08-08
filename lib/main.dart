import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Metro Smart Guide',
      theme: ThemeData(
        primaryColor: const Color(0xFFEF3332),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      home: const App(),
    );
  }
}
