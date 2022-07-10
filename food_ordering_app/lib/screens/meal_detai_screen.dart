import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/Meal-Detail-Screen";
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        dummyMeals.firstWhere(((element) => element.id == mealId));
    return Scaffold(
      appBar: AppBar(
        title: Text("The Meal ${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            _title(context, 'Ingredients'),
            _listIngredientsValues(selectedMeal),
            _title(context, 'Steps for prepration'),
            _listStepsValues(selectedMeal)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }

  Container _title(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  Container _listIngredientsValues(Meal selectedMeal) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      width: 300,
      height: 180,
      child: ListView.builder(
          itemCount: selectedMeal.ingredients.length,
          itemBuilder: ((context, index) => Card(
                color: Theme.of(context).accentColor,
                elevation: 2,
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index])),
              ))),
    );
  }

  Container _listStepsValues(Meal selectedMeal) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      width: 300,
      height: 180,
      child: ListView.builder(
        itemCount: selectedMeal.steps.length,
        itemBuilder: ((context, index) => Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Text('# ${index + 1}'),
                  ),
                  title: Text(selectedMeal.steps[index]),
                ),
                const Divider(),
              ],
            )),
      ),
    );
  }
}
