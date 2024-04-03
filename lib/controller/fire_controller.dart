import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wanderlog/model/user_model.dart';

class FireController with ChangeNotifier {
  final db = FirebaseFirestore.instance;

//-----------create
  Future addUser(String uid, UserModel userModel) async {
    db.collection("User").doc(uid).set(userModel.tojson(uid));
  }

//-------------delete

//-------------update

//-----------read
  UserModel? currentUserData;
  Future fetchCurrentUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      currentUserData = UserModel.fromJson(snapshot.data()!);
      print(snapshot.data());
    }
  }
}
