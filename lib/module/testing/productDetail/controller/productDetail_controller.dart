import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/productDetail_view.dart';

class ProductDetailController extends ChangeNotifier
    implements HyperController {
  ProductDetailView? view;
  int qty = 0;

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
}

final productDetailController =
    ChangeNotifierProvider<ProductDetailController>((ref) {
  return ProductDetailController();
});
