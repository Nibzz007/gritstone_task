// battery_controller.dart
import 'package:get/get.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:hive/hive.dart';
import '../model/battery_and_location_model.dart';

class BatteryController extends GetxController {
  final Battery _battery = Battery();
  final _batteryDataList = <BatteryData>[].obs;

  List<BatteryData> get batteryDataList => _batteryDataList;

  @override
  void onInit() {
    super.onInit();
    _loadDataFromHive();
    _startBatteryListener();
  }

  void _loadDataFromHive() {
    final box = Hive.box<BatteryData>('batteryBox');
    _batteryDataList.assignAll(box.values.toList());
  }

  Future<void> _startBatteryListener() async {
    _battery.onBatteryStateChanged.listen((BatteryState state) async {
      final batteryLevel = await _battery.batteryLevel;
      final newData = BatteryData(batteryLevel: batteryLevel, time: DateTime.now());

      // Save to Hive database
      final box = Hive.box<BatteryData>('batteryBox');
      await box.add(newData);

      _batteryDataList.add(newData);
    });
  }

  @override
  void onClose() {
    Hive.close();
    super.onClose();
  }
}
