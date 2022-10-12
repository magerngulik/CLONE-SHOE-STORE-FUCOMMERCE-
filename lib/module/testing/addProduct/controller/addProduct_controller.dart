import 'package:fhe_template/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProductController extends ChangeNotifier implements HyperController {
  AddProductView? view;

  addProduct() async {
    bool isCreatedMode = view!.product == null;
    var name = Input.get("name1");
    var photo = Input.get("image");
    var price = Input.get("price1");
    var description = Input.get("description");
    var qty = Input.get("qty");
    var category = Input.get("category");
    var brand = Input.get("brand");

    // debugPrint("name: $name");
    // debugPrint("photo: $photo");
    // debugPrint("price: $price");
    // debugPrint("description: $description");
    // debugPrint("qty: $qty");
    // debugPrint("category: $category");
    // debugPrint("brand: $brand");
    if (isCreatedMode) {
      await ProductService.addProduct(Product(
          productName: name,
          photo: photo,
          price: int.parse(price),
          description: description,
          seller: Seller(
              uid: FirebaseAuth.instance.currentUser!.uid,
              sellerName: FirebaseAuth.instance.currentUser!.displayName),
          galleries: [
            "https://i.ibb.co/S32HNjD/no-image.jpg",
            "https://i.ibb.co/PGv8ZzG/me.jpg",
            "https://i.ibb.co/S32HNjD/no-image.jpg",
          ],
          qty: int.parse(qty),
          brand: brand,
          category: category));
    } else {
      var id = view!.product?.id;
      debugPrint("variableName: $id");

      await ProductService.updateProduct(Product(
          id: view!.product!.id,
          productName: name,
          photo: photo,
          price: int.parse(price),
          description: description,
          seller: Seller(
              uid: FirebaseAuth.instance.currentUser!.uid,
              sellerName: FirebaseAuth.instance.currentUser!.displayName),
          galleries: [
            "https://i.ibb.co/S32HNjD/no-image.jpg",
            "https://i.ibb.co/PGv8ZzG/me.jpg",
            "https://i.ibb.co/S32HNjD/no-image.jpg",
          ],
          qty: int.parse(qty),
          brand: brand,
          category: category));
    }

    Get.back();
  }
}

final addProductController =
    ChangeNotifierProvider<AddProductController>((ref) {
  return AddProductController();
});
