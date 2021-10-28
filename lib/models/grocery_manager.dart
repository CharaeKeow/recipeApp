//To manage the grocery items

import 'package:flutter/material.dart';

import 'grocery_item.dart';

class GroceryManager extends ChangeNotifier {
  final _groceryItems = <GroceryItem>[];

  //public getter. Unmodifiable, so read-only
  List<GroceryItem> get groceryItems => List.unmodifiable(_groceryItems);

  void deleteItem(int index) { //delete item at given index
    _groceryItems.removeAt(index);
    notifyListeners();
  }

  void addItem(GroceryItem item) { //add new item at the end of list
    _groceryItems.add(item);
    notifyListeners();
  }

  //replace old item at given index with new item
  void updateItem(GroceryItem item, int index) {
    _groceryItems[index] = item;
    notifyListeners();
  }

  //toggles the `isComplete` flag on or off
  void completeItem(int index, bool change) {
    final item = _groceryItems[index];
    _groceryItems[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}