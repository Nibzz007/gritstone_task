import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gritstone_task/controller/product_controller.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  
  @override
  void initState() {
    controller.getProduct();
    controller.getCategory();
    super.initState();
  }

  ProductController controller = Get.put(ProductController());
  //List productList = controller.productModel.products;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : _buildBody(height),
      ),
    );
  }

  Widget _buildBody(double height) {
    return ListView.separated(
      itemCount: controller.productModel.products.length + controller.categoryModel.products.length,
      itemBuilder: (context, index) {
        index % 6 == 5 ? 
         Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            tileColor: Colors.black12,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                controller.productModel.products[index].thumbnail,
              ),
            ),
            title: Text(
              controller.productModel.products[index].title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              controller.productModel.products[index].brand,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              '€ ${controller.productModel.products[index].price.toString()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ) : Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            tileColor: Colors.black12,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                controller.categoryModel.products[index].thumbnail,
              ),
            ),
            title: Text(
              controller.categoryModel.products[index].title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              controller.categoryModel.products[index].brand,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              '€ ${controller.categoryModel.products[index].price.toString()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
        return null;
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
        );
      },
    );
  }
}
