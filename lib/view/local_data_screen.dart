import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/battery_controller.dart';

class LocalScreen extends StatefulWidget {
  LocalScreen({super.key});

  @override
  State<LocalScreen> createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {

  
  final BatteryController batteryController = Get.put(BatteryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Battery Details')),
      body: Obx(
        () => ListView.builder(
          itemCount: batteryController.batteryDataList.length,
          itemBuilder: (context, index) {
            final data = batteryController.batteryDataList[index];
            return ListTile(
              title: Text('Battery Level: ${data.batteryLevel}%'),
              subtitle: Text('Time: ${data.time}'),
            );
          },
        ),
      ),
    );
  }
}