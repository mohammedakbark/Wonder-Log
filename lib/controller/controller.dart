import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  //----------Serching
  TextEditingController serchController = TextEditingController();
  clearsearchField() {
    serchController.clear();
    notifyListeners();
  }

//--------------edit profile
  TextEditingController editiNameController = TextEditingController();
  TextEditingController editiBioController = TextEditingController();
  clearProfileField() {
    editiNameController.clear();
    editiBioController.clear();
    notifyListeners();
  }

  //-----------edit password
  TextEditingController emailController = TextEditingController();
  clearpasswordField() {
    emailController.clear();
    notifyListeners();
  }

  //----------request
  TextEditingController placeNameController = TextEditingController();
  TextEditingController placeBioController = TextEditingController();
  clearRequest() {
    placeBioController.clear();
    placeNameController.clear();
    notifyListeners();
  }

//  -------------nav
  int selectedNavindex = 0;
  changeNavIndex(value) {
    selectedNavindex = value;
    notifyListeners();
  }
}
