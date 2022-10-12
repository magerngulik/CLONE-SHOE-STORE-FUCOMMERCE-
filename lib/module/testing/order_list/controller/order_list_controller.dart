import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/order_list_view.dart';

class OrderListController extends ChangeNotifier implements HyperController {
  OrderListView? view;
}

final orderListController = ChangeNotifierProvider<OrderListController>((ref) {
  return OrderListController();
});
