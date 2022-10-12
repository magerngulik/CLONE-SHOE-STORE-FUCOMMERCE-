import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fhe_template/riverpod_util.dart';
import '../view/devHome_view.dart';

class DevHomeController extends ChangeNotifier implements HyperController {
  DevHomeView? view;

  cekabsen() async {
    var date = DateTime.now();

    await FirebaseFirestore.instance.collection("absenMasuk").add({
      "absen": DateTime.now(),
    });
  }
}

final devHomeController = ChangeNotifierProvider<DevHomeController>((ref) {
  return DevHomeController();
});
