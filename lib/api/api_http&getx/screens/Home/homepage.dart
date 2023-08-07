import 'package:flutter/material.dart';
import 'package:flutter_classwork/api/api_http&getx/controller/productController.dart';
import 'package:flutter_classwork/api/api_http&getx/screens/Home/widgets/productTile.dart';

import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: ApiHomePage(),
  ));
}

class ApiHomePage extends StatelessWidget {
  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products from Api'),
      ),
      body: SizedBox(
        child: Obx(() {
          if (productController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return ProductTile(productController.productList[index]);
              },
              itemCount: productController.productList.length,
            );
          }
        }),
      ),
    );
  }
}