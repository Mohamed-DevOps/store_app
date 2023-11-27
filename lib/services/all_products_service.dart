import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/utils/constants.dart';

class AllProductsService {
  Future<List<ProductModel>> getAllProducts() async {
    final List data = await Api().get(url: "${Constants.baseUrl}/products");

    List<ProductModel> productsList = [];
    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }

    return productsList;
  }
}
