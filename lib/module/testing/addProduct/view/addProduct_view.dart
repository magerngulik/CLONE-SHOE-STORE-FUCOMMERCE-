import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProductView extends ConsumerWidget {
  Product? product;
  AddProductView({this.product, Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    AddProductController controller = ref.watch(addProductController);
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              QimagePicker(
                onChanged: (value) {},
                label: "Image Product",
                id: "image",
                value: product != null ? product!.photo : null,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "id",
                label: "id",
                cicon: Icons.person,
                value: product != null ? product!.id : null,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "name1",
                label: "Name",
                cicon: Icons.person,
                value: product != null ? product!.productName : null,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "price1",
                label: "Price",
                cicon: Icons.money,
                value: product != null ? product!.price.toString() : null,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "description",
                label: "description",
                cicon: Icons.money,
                value: product != null ? product!.description : null,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "qty",
                label: "qty",
                cicon: Icons.money,
                value: product != null ? product!.qty.toString() : null,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "category",
                label: "category",
                cicon: Icons.money,
                value: product != null ? product!.category : null,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "brand",
                label: "brand",
                cicon: Icons.money,
                value: product != null ? product!.brand : null,
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // <-- Radius
                    ),
                  ),
                  onPressed: () {
                    controller.addProduct();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
