import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../model/location_model.dart';

class LocationController extends GetxController {
   Future<void> _storeLocationData(double latitude, double longitude) async {
    final locationBox = Hive.box<LocationModel>('locationBox');
    final locationModel = LocationModel(latitude, longitude);
    await locationBox.add(locationModel);
  }

  Future<void> _getLocationData() async {
    final geolocator = GeolocatorPlatform.instance;
    try {
      LocationPermission permission = await geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Permission Denied', 'Location permission is required.');
        return;
      }

      Position position = await geolocator.getCurrentPosition(
      );

      final latitude = position.latitude;
      final longitude = position.longitude;
      await _storeLocationData(latitude, longitude);
      Get.snackbar('Success', 'Location data stored.');
    } catch (e) {
      print('Error getting location: $e');
      Get.snackbar('Error', 'Failed to get location.');
    }
  }
}