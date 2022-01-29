import 'package:aevex_demo/pages/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aevex Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const InputPage(title: 'Aevex Demo Input Page'),
    );
  }
}