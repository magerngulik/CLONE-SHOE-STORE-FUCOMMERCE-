import 'package:fhe_template/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfiletestingController extends ChangeNotifier
    implements HyperController {
  ProfiletestingingView? view;

  doLogout() async {
    await FirebaseAuth.instance.signOut();
    Get.to(const WelcomeScreenView());
    // Navigator.push(
    //   Get.currentContext,
    //   MaterialPageRoute(builder: (context) => const WelcomeView()),
    // );
  }
}

final profiletestingController =
    ChangeNotifierProvider<ProfiletestingController>((ref) {
  return ProfiletestingController();
});
