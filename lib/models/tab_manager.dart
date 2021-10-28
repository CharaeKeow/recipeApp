import 'package:flutter/material.dart';

//manages the tab index that user taps
class TabManager extends ChangeNotifier {
  int selectedTab = 0; // keep track of which tab are being tapped

  void goToTab(index) { //modify the current tab index
    selectedTab = index;
    notifyListeners(); //notify all widgets listening to this state
  }

  void goToRecipes() { //sets selectedTab to the Recipes tab (index 1)
    selectedTab = 1;
    notifyListeners(); //notifies all widgets that Recipes is the selected tab
  }
}