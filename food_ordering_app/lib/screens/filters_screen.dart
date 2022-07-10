import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters-screen";
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String subTitle, bool currentValue,
      Function(bool)? updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filter Screen"),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text("Adjust Your meal Selections",
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  "Gluten-Free", "Only include Gluten free items", _glutenFree,
                  (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
              _buildSwitchListTile(
                  "Lactos-Free", "Only include Lactos free items", _lactoseFree,
                  (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
              _buildSwitchListTile(
                  "Vegetarian", "Only include Vegetarian items", _vegetarian,
                  (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
              _buildSwitchListTile("Vegan", "Only include Vegan items", _vegan,
                  (value) {
                setState(() {
                  _vegan = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }
}
