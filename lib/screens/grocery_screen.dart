import 'package:flutter/material.dart';

import 'empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Scaffold as main layout
    return Scaffold(
      //floating button with + icon
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          //TODO: Present GroceryItemScreen
        }
      ),
      //build the rest of the Grocery's screen subtree
      body: buildGroceryScreen(),
    );
  }

  Widget buildGroceryScreen() {
    //Wrap widget inside `Consumer`, which listens for `GroceryManager` state
    //changes
    return Consumer<GroceryManager>(
      //rebuild widget below if grocery manager items changes
      builder: (context, manager, child) {
        //if list not empty, show `GroceryListScreen`
        if (manager.groceryItems.isNotEmpty) {
          //TODO: Add GroceryListScreen
          return Container();
        } else {
          //else show empty screen
          return const EmptyGroceryScreen();
        }
      }
    );
  }
}