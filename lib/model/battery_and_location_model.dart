// battery_data.dart
import 'package:hive/hive.dart';
part 'battery_and_location_model.g.dart';

@HiveType(typeId: 0)
class BatteryData extends HiveObject {
  @HiveField(0)
  int batteryLevel;

  @HiveField(1)
  DateTime time;

  BatteryData({required this.batteryLevel, required this.time});
}
