import 'package:hive/hive.dart';

part 'location_model.g.dart'; // This will be generated by Hive

@HiveType(typeId: 0)
class LocationModel extends HiveObject {
  @HiveField(0)
  double latitude;

  @HiveField(1)
  double longitude;

  LocationModel(this.latitude, this.longitude);
}
