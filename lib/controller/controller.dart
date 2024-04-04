import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class Controller extends ChangeNotifier {
//------------------------
  bool isLoading = false;
  File? newPost;
  final _imagePicker = ImagePicker();
  SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
  Future<File> pickPostImage() async {
    // isLoading = true;
    final pickedXfile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedXfile != null) {
      return newPost = File(pickedXfile.path);
    }
    print(newPost);
    notifyListeners();
    // isLoading = false;
    return newPost!;
  }

  //----------Serching
  TextEditingController serchController = TextEditingController();
  clearsearchField() {
    serchController.clear();
    notifyListeners();
  }

//--------------edit profile

  //-----------edit password
  TextEditingController emailController = TextEditingController();
  clearpasswordField() {
    emailController.clear();
    notifyListeners();
  }

//  -------------nav
  int selectedNavindex = 0;
  changeNavIndex(value) {
    selectedNavindex = value;
    notifyListeners();
  }
}
