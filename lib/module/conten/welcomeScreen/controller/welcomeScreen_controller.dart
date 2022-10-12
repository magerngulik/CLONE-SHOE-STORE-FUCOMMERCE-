import 'package:fhe_template/core.dart';
import 'package:fhe_template/services/users_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class WelcomeScreenController extends ChangeNotifier
    implements HyperController {
  WelcomeScreenView? view;

  doLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await googleSignIn.disconnect();
    } catch (_) {}

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      UserServices.doSaveUserData();
      Navigator.push(
        Get.currentContext,
        MaterialPageRoute(builder: (context) => const DashboardView()),
      );
    } catch (_) {
      debugPrint("Gagal Login");
    }
  }
}

final welcomeScreenController =
    ChangeNotifierProvider<WelcomeScreenController>((ref) {
  return WelcomeScreenController();
});
