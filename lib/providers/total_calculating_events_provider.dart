import 'package:flutter/material.dart';

class ProductEvents with ChangeNotifier {
  int selectedIndex = 0;
  int numberOfProducts = 1;

  void selectingIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  void increment() {
    numberOfProducts++;
    notifyListeners();
  }

  void decrement() {
    numberOfProducts==0?numberOfProducts=0:numberOfProducts--;
    notifyListeners();
  }
}
