import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/demo_view.dart';

class DemoController extends ChangeNotifier implements HyperController {
  DemoView? view;
}

final demoController = ChangeNotifierProvider<DemoController>((ref) {
  return DemoController();
});
