import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wanderlog/model/new_post.dart';
import 'package:wanderlog/model/user_model.dart';
import 'package:wanderlog/util/snack_bar.dart';

class FireController with ChangeNotifier {
  final db = FirebaseFirestore.instance;
//---------------pickeImage
  File? fileImage;
  
  String? _url;

  final _imagePicker = ImagePicker();
  final _firbaseStorage = FirebaseStorage.instance;
  SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
// ----------------------- I M A G E ----------------------
  pickImage() async {
    final pickedXfile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedXfile != null) {
      final currenttime = DateTime.now();
      fileImage = File(pickedXfile.path);
      UploadTask uploadTask = _firbaseStorage
          .ref()
          .child("profileImage/User${currenttime.millisecond}")
          .putFile(fileImage!, metadata);
      TaskSnapshot snapshot = await uploadTask;
      await snapshot.ref.getDownloadURL().then((url) {
        db
            .collection("User")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({"imageUrl": url});
      });
      notifyListeners();
    }
  }

  //----------P O S T I M A G E
  Future<String?> urlGenarator(newPost) async {
    final currenttime = DateTime.now();
    UploadTask uploadTask = _firbaseStorage
        .ref()
        .child(
            "Post/${FirebaseAuth.instance.currentUser!.uid}/${currenttime.millisecond}")
        .putFile(newPost!, metadata);
    TaskSnapshot snapshot = await uploadTask;
    await snapshot.ref.getDownloadURL().then((value) {
      _url = value;
    });
    return _url;
  }

  

//-----------create
  Future addUser(String uid, UserModel userModel) async {
    db.collection("User").doc(uid).set(userModel.tojson(uid));
  }

  Future addNewPost(AddNewPost addNewPost) async {
    final doc = db.collection("Post").doc();
    doc.set(addNewPost.toJson(doc.id));
  }
//-------------delete

//-------------update
  Future updateUserProfile(String name, String bio, String dec) async {
    DocumentReference doc =
        db.collection("User").doc(FirebaseAuth.instance.currentUser!.uid);

    if (name.isNotEmpty) {
      doc.update({
        "name": name,
      });
    }
    if (bio.isNotEmpty) {
      doc.update({
        "bio": bio,
      });
    }
    if (dec.isNotEmpty) {
      doc.update({"description": dec});
    }
    notifyListeners();
  }

//-----------read
  UserModel? currentUserData;
  Future fetchCurrentUserData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await db
        .collection("User")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      currentUserData = UserModel.fromJson(snapshot.data()!);
    }
  }
}
