import 'package:flutter/material.dart';
import 'package:store_app/components/custom_card.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/all_products_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Trend'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 70),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;

              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 100,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return CustomCard(
                    product: products[index],
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final http.Response response = await http.post(
      //       Uri.parse("https://fakestoreapi.com/products"),
      //       body: {
      //         'title': " test ",
      //         'price': '13.5',
      //         'description': 'lorem ipsum set',
      //         'image': "https://i.pravatar.cc",
      //         'category': 'electronic',
      //       },
      //       headers: {
      //         'Accept': 'application/json',
      //         'content-type': 'application/x-www-form-urlencoded',
      //         'Authorization': "Bearer "
      //       },
      //     );

      //     print(response.body);
      //   },
      //   tooltip: 'Add',
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
