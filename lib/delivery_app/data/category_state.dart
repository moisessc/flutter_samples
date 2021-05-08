import 'package:flutter/material.dart';

class CategoryState with ChangeNotifier {
  int _categorySelected = 0;

  int get categorySelected => _categorySelected;

  set categorySelected(int category) {
    _categorySelected = category;
    notifyListeners();
  }
}
