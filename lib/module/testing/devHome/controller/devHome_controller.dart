import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fhe_template/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DevHomeController extends ChangeNotifier implements HyperController {
  DevHomeView? view;

  cekabsen() async {
    var date = DateTime.now();

    await FirebaseFirestore.instance.collection("absenMasuk").add({
      "absen": DateTime.now(),
    });
  }

  doDelete(Product product) {
    ProductService.deleteProduct(product);
  }
}

final devHomeController = ChangeNotifierProvider<DevHomeController>((ref) {
  return DevHomeController();
});
