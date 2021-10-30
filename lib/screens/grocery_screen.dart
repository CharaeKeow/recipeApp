import 'package:flutter/material.dart';

import 'empty_grocery_screen.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';
import 'grocery_list_screen.dart';

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
          //return GroceryManager available in the tree
          final manager = Provider.of<GroceryManager>(
            context,
            listen: false);
          //add new route to the stack of routes
          Navigator.push(
            context,
            //replace the entire screen with platform-specific transition
            //e.g. slide upwards and fades in in Android, slides in from the
            //right in iOS
            MaterialPageRoute(
              //create new `GroceryItem` within the route's builder callback
              builder: (context) => GroceryItemScreen(
                //defines what to do with the created item
                onCreate: (item) {
                  //add to list of item
                  manager.addItem(item);
                  //once item is added, `pop` the top navigation route item,
                  //`GroceryItemScreen`, to show the list of grocery items
                  Navigator.pop(context);
                },
                  //empty as it's never called during creating new item
                onUpdate: (item) {}
                ),
            ),
          );
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
          return GroceryListScreen(manager: manager);
        } else {
          //else show empty screen
          return const EmptyGroceryScreen();
        }
      }
    );
  }
}