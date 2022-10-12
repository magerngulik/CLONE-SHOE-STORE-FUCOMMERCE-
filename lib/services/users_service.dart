import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  static doSaveUserData() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (snapshot.exists) {
      return;
    }

    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      "email": FirebaseAuth.instance.currentUser!.email,
      "photo": FirebaseAuth.instance.currentUser!.photoURL ??
          "https://i.ibb.co/PGv8ZzG/me.jpg",
      "full_name": FirebaseAuth.instance.currentUser!.displayName ?? "No name"
    });
  }
}
