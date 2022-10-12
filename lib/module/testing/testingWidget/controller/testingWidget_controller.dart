import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/testingWidget_view.dart';

class TestingWidgetController extends ChangeNotifier
    implements HyperController {
  TestingWidgetView? view;
}

final testingWidgetController =
    ChangeNotifierProvider<TestingWidgetController>((ref) {
  return TestingWidgetController();
});
