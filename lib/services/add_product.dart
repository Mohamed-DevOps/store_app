import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/utils/constants.dart';

class AddProductService {
  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    final Map<String, dynamic> data = await Api().post(
      url: "${Constants.baseUrl}/products",
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
