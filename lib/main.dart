import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gritstone_task/view/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/battery_and_location_model.dart';


void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(BatteryDataAdapter());
  await Hive.openBox<BatteryData>('batteryBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(useMaterial3: true),
    );
  }
}
