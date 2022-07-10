import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorait_screen.dart';

class TabsScreen extends StatefulWidget {
  static const routeName = "/";
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Meals'),
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.category),
              text: "Category",
            ),
            Tab(
              icon: Icon(Icons.star),
              text: "Favorait",
            ),
          ]),
        ),
        drawer: MainDrawer(key: Key('Drawer')),
        body: const TabBarView(
          children: [
            CategoryScreen(
              key: Key('categories'),
            ),
            FavouraitScreen(),
          ],
        ),
      ),
    );
  }
}
