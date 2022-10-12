import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/home_view.dart';

class HomeController extends ChangeNotifier implements HyperController {
  HomeView? view;

  String selectedProductCategoryName = "";
  updateSelectedProductCategory(productCategoryName) {
    selectedProductCategoryName = productCategoryName;
    notifyListeners();
  }
}

final homeController = ChangeNotifierProvider<HomeController>((ref) {
  return HomeController();
});
