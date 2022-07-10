import 'package:flutter/material.dart';

import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Mealz Mania :)',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildDrawerItem("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(TabsScreen.routeName);
          }),
          buildDrawerItem("Filter", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }

  Widget buildDrawerItem(String name, IconData icon, Function()? action) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      onTap: action,
    );
  }
}
