import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/components/custom_button.dart';
import 'package:store_app/components/custom_text_field.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, image;
  String? price;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Update Product'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                CustomTextField(
                  onChanged: (value) {
                    productName = value;
                  },
                  labelText: 'Title',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (value) {
                    price = value;
                  },
                  labelText: 'Price',
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (value) {
                    description = value;
                  },
                  labelText: 'Description',
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  onChanged: (value) {
                    image = value;
                  },
                  labelText: 'Image',
                ),
                const SizedBox(height: 50),
                CustomButton(
                  onTap: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                      await updateProduct(product);
                      debugPrint('success');
                    } catch (e) {
                      debugPrint(e.toString());
                    }

                    isLoading = false;
                    setState(() {});
                  },
                  title: 'Update',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      productId: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price.toString() : price!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      category: product.category,
    );
  }
}
