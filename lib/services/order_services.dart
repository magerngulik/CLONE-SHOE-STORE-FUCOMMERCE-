import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/product/product.dart';

class OrderServices {
  static addOrder({required List<Product> items, required double total}) async {
    var productList = [];

    for (var i = 0; i < items.length; i++) {
      var product = items[i];
      //memasukan list dari model ke dalam list biasa
      productList.add({
        "product_name": product.productName,
        "photo": product.photo,
        "price": product.price,
        "description": product.description,
        "seller": {
          "uid": product.seller!.uid,
          "seller_name": product.seller!.sellerName
        },
      });
    }
    await FirebaseFirestore.instance.collection("orders").add({
      "created_at": Timestamp.now(),
      "customer": {
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "customer_name": FirebaseAuth.instance.currentUser!.displayName
      },
      "total": total,
      "items": productList
    });
  }
}
