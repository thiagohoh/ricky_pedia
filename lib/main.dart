import 'package:flutter/material.dart';
import 'package:ricky_pedia/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick pedia',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Dashboard(),
    );
  }
}
