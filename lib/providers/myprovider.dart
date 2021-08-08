import 'package:flutter/cupertino.dart';

class MyProvider extends ChangeNotifier {
  String myName = "Mohammed Saqer";
  changNameVlaue(String name) {
    myName = name;
    notifyListeners();
  }
}
