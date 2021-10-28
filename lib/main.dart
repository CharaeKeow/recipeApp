import 'package:flutter/material.dart';
import 'package:fooderlich/models/tab_manager.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'models/models.dart';
import 'home.dart';

void main() {
  // 1
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  // 2
  const Fooderlich({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();

    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      //assign MultiProvider as property of Home. It accepts a list of providers
      // for Home's descendant widget to access
      home: MultiProvider(
        providers: [
          //creates an instance of TabManager, which listen to tab index changes
          //and notifies its listeners
          ChangeNotifierProvider(create: (context) => TabManager()),
          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],
        child: const Home(),
      )
    );
  }
}