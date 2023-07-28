import 'dart:convert';
import 'package:battery_plus/battery_plus.dart';
import 'package:get/get.dart';
import 'package:gritstone_task/model/category_model.dart';
import 'package:gritstone_task/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  late ProductModel productModel = getProduct();
  late CategoryModel categoryModel = getCategory();

  getProduct() async {
    try {
      isLoading(true);
      String baseUrl = 'https://dummyjson.com/products';
      Uri url = Uri.parse(baseUrl);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        productModel = ProductModel.fromJson(jsonDecode(response.body));
        return productModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('$e');
    } finally {
      isLoading(false);
    }
  }

  getCategory() async {
    try {
      isLoading(true);
      String baseUrl = 'https://dummyjson.com/products/category/smartphones';
      Uri url = Uri.parse(baseUrl);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        categoryModel = CategoryModel.fromJson(jsonDecode(response.body));
        return categoryModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('$e');
    } finally {
      isLoading(false);
    }
  }

  // Battery level
  void getBatteryLevel() async {
    final Battery battery = Battery();
    int batteryLevel = await battery.batteryLevel;
  }
  // Location tracking background
}
