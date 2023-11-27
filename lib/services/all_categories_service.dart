import 'package:store_app/helper/api.dart';
import 'package:store_app/utils/constants.dart';

class AllCategoriesService {
  Future<List> getAllCategories() async {
    final List data =
        await Api().get(url: "${Constants.baseUrl}/products/categories");

    return data;
  }
}
