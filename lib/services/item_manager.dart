import 'package:flutter/material.dart';

class ItemManager extends ChangeNotifier {
  int _selectedIndex = 0;
  List<Map<String, String>> checkoutItems = [];

  int get selectedIndex =>
      _selectedIndex; //gets the integer in _selectedIndex and returns to selectedIndex

  List<Map<String, String>> get items =>
      checkoutItems; //gets the list of checkoutItems and returns to items

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void addItem(String imageUrl, String name, String amount) {
    checkoutItems.add({
      'imageUrl': imageUrl,
      'name': name,
      'amount': amount,
    });
    _selectedIndex = 1;
    notifyListeners();
  }

  void removeItem(int index) {
    checkoutItems.removeAt(index);
    notifyListeners();
  }

  void orderItem(int index) {
    checkoutItems.removeAt(index);
    notifyListeners();
  }
}
