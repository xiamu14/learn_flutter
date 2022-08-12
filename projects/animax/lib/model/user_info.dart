import 'package:flutter/material.dart';

class Interests extends ChangeNotifier {
  List<String> list = [];

  void addInterest(String interest) {
    list.add(interest);
    notifyListeners();
  }

  void removeInterest(String interest) {
    list.remove(interest);
    notifyListeners();
  }

  bool isSelected(String interest) {
    return list.contains(interest);
  }
}
