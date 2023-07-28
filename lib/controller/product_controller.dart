import 'dart:convert';
import 'package:get/get.dart';
import 'package:gritstone_task/model/category_model.dart';
import 'package:gritstone_task/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  ProductModel? productModel;
  CategoryModel? categoryModel;

  @override
  Future<void> onInit() async {
    super.onInit();
    getProduct();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

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

  List getProductList() {
    return productModel!.products;
  }

  List getCategorList() {
    return categoryModel!.products;
  }

  // Battery level

  // Location tracking background
}
