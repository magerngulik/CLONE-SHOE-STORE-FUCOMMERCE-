import 'package:fhe_template/core.dart';
import 'package:fhe_template/services/order_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckoutController extends ChangeNotifier implements HyperController {
  CheckoutView? view;
  addCheckout() {
    OrderServices.addOrder(
        items: CartService.cartItem, total: CartService.total);
    CartService.deleteAll();
    Get.offAll(const DashboardView());
  }
}

final checkoutController = ChangeNotifierProvider<CheckoutController>((ref) {
  return CheckoutController();
});
