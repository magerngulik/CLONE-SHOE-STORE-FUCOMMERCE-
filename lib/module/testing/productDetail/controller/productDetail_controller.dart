import 'package:fhe_template/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductDetailController extends ChangeNotifier
    implements HyperController {
  ProductDetailView? view;
  int qty = 1;

  addQty() {
    qty++;
    notifyListeners();
  }

  removeQty() {
    if (qty == 1) {
      return;
    }
    qty--;
    notifyListeners();
  }

  addtoCart() async {
    var product = view!.item.copyWith(qty: qty);
    if (CartService.isExists(product)) {
      await showDialog<void>(
        context: Get.currentContext,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Info'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Item ini sudah ada di keranjang anda!'),
                ],
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Ok",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      );
      return;
    }

    CartService.addItem(product);
    cartController.notifier;
    qty = 1;
    Get.back();
  }

  isRemoveQty() {
    qty = 1;
    Get.back();
  }
}

final productDetailController =
    ChangeNotifierProvider<ProductDetailController>((ref) {
  return ProductDetailController();
});
