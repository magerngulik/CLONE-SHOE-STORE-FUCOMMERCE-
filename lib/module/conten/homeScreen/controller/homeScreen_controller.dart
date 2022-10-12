import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/homeScreen_view.dart';
import 'package:flutter/material.dart';

class HomeScreenController extends ChangeNotifier implements HyperController {
  HomeScreenView? view;
}

final homeScreenController =
    ChangeNotifierProvider<HomeScreenController>((ref) {
  return HomeScreenController();
});
