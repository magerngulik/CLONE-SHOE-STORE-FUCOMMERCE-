import 'package:fhe_template/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await initialize();

  Widget mainView = const WelcomeScreenView();
  if (FirebaseAuth.instance.currentUser != null) {
    mainView = const WelcomeScreenView();
  }

  runApp(
    ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: Get.navigatorKey,
        theme: DafaultThemeShere.defaultThame,
        home: mainView,
      ),
    ),
  );
}
