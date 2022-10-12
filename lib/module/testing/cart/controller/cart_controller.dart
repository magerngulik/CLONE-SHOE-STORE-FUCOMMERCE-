import 'package:fhe_template/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartController extends ChangeNotifier implements HyperController {
  CartView? view;

  deleteAll() {
    CartService.deleteAll();
    update();
  }

  refrest() {
    notifyListeners();
  }

  addQty(Product product) {
    CartService.addQty(product);
    update();
  }

  decQty(Product product) {
    CartService.decQty(product);
    update();
  }
}

final cartController = ChangeNotifierProvider<CartController>((ref) {
  return CartController();
});
