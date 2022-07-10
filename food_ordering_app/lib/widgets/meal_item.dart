import 'package:flutter/material.dart';

import '../model/meal.dart';
import '../screens/meal_detai_screen.dart';

class MealItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  }) : super(key: key);

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => onMealSelected()),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    width: double.infinity,
                    height: 280,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: Container(
                    color: Colors.black54,
                    width: 250,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      widget.title,
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(widget.duration.toString() + " min")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work_outline,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(parseComplexity),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(parseAffordability),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String get parseComplexity {
    switch (widget.complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Hard:
        return 'Hard';
      case Complexity.Challenging:
        return 'Challenging';
      default:
        return 'Unknown';
    }
  }

  String get parseAffordability {
    switch (widget.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Expensive';
      case Affordability.Pricey:
        return 'Pricey';
      default:
        return 'Unknown';
    }
  }

  void onMealSelected() {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routeName, arguments: widget.id)
        .then((value) {
      if (value != null) {
        print(value);
      }
    });
  }
}
