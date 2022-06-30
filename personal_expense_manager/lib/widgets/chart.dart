import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(
        days: index,
      ));

      var totalValue = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalValue += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalValue};
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (MediaQuery.of(context).size.height -
              (Scaffold.of(context).appBarMaxHeight as double) -
              MediaQuery.of(context).padding.top) *
          0.30,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions.map((data) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    label: data['day'].toString(),
                    spendingAmount: data['amount'].toString(),
                    percentOfSpending: totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
