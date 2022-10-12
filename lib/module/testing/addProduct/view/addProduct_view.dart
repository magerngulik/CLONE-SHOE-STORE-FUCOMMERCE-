import 'package:fhe_template/shared/widget/image_picker.dart';
import 'package:fhe_template/shared/widget/textfield_login_email.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controller/addProduct_controller.dart';

class AddProductView extends ConsumerWidget {
  const AddProductView({Key? key}) : super(key: key);

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
                  onChanged: (value) {}, label: "Image Product", id: "image"),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "name1",
                label: "Name",
                cicon: Icons.person,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "price1",
                label: "Price",
                cicon: Icons.money,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "description",
                label: "description",
                cicon: Icons.money,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "seller",
                label: "seller",
                cicon: Icons.money,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "qty",
                label: "qty",
                cicon: Icons.money,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "category",
                label: "category",
                cicon: Icons.money,
              ),
              QTextfieldLoginEmail(
                onChanged: (value) {},
                id: "brand",
                label: "brand",
                cicon: Icons.money,
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
