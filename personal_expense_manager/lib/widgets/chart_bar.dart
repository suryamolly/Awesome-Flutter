import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final String spendingAmount;
  final double percentOfSpending;
  const ChartBar(
      {Key? key,
      required this.label,
      required this.spendingAmount,
      required this.percentOfSpending})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: SizedBox(
            height: 20,
            child: Text(
              '\u{20B9}$spendingAmount',
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey,
                ),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              heightFactor: percentOfSpending,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 5,
        ),
        FittedBox(
          child: Text(
            label.substring(0, 1),
          ),
        ),
      ],
    );
  }
}
