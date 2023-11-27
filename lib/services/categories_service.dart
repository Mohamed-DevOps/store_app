import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/utils/constants.dart';

class CategoriesService {
  Future<List<ProductModel>> getProductsCategories(
      {required String categoryName}) async {
    final List jsonData = await Api()
        .get(url: "${Constants.baseUrl}/products/category/$categoryName");

    List<ProductModel> productsList = [];
    for (int i = 0; i < jsonData.length; i++) {
      productsList.add(ProductModel.fromJson(jsonData[i]));
    }

    return productsList;
  }
}
