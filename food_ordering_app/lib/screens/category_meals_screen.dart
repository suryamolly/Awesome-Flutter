import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoriesMealsScreen extends StatelessWidget {
  static const routeName = "/category-meal";
  // final String categoryId;
  // final String categoryTitle;
  const CategoriesMealsScreen({
    Key? key,
    // required this.categoryId,
    // required this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final String? categoryTitle = routeArguments['title'];
    final String? categoryId = routeArguments['id'];
    final categoryMeals = dummyMeals.where(((element) {
      return element.categories.contains(categoryId);
    })).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability);
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
