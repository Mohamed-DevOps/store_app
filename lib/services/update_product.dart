import 'package:flutter/material.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/utils/constants.dart';

class UpdateProductService {
  Future<ProductModel> updateProduct({
    required int productId,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    debugPrint('product id = $productId');

    final Map<String, dynamic> data = await Api().put(
      url: "${Constants.baseUrl}/products/$productId",
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
