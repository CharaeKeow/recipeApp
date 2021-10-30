import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/models.dart';
import 'screens/explore_screen.dart';
import 'screens/recipes_screen.dart';
import 'components/components.dart';
import 'screens/grocery_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipesScreen(),
    GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<TabManager>(builder: (context, tabManager, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            //`Theme.of(context)` returns the nearest `Theme` in the widget tree
            //If the widget has a defined theme, it will returns that, otherwise
            //it returns the app theme.
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: IndexedStack(index: tabManager.selectedTab, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
          Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: tabManager.selectedTab,
          onTap: (index){
            tabManager.goToTab(index);
          },
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      );
    });

  }
}