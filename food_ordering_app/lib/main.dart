import 'package:flutter/material.dart';

import 'screens/category_meals_screen.dart';
import 'screens/filters_screen.dart';
import 'screens/meal_detai_screen.dart';
import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
            ),
      ),
      //home: const CategoryScreen(key: Key("category")),
      initialRoute: "/",
      routes: {
        TabsScreen.routeName: (context) => TabsScreen(key: const Key("Tabs")),
        CategoriesMealsScreen.routeName: (context) =>
            const CategoriesMealsScreen(),
        MealDetailScreen.routeName: (context) => const MealDetailScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen(),
      },
    );
  }
}
