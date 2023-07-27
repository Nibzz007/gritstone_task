import 'package:flutter/material.dart';
import 'package:gritstone_task/view/local_data_screen.dart';
import 'package:gritstone_task/view/products_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            labelPadding: EdgeInsets.only(
              bottom: 10,
              top: 10,
            ),
            tabs: [
              Text('Products'),
              Text('Local data'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProductsScreen(),
            LocalScreen(),
          ],
        ),
      ),
    );
  }
}
