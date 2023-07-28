import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gritstone_task/view/home_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
