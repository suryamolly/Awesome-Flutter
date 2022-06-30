import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactions extends StatefulWidget {
  final Function addTransaction;

  const AddTransactions({
    Key? key,
    required this.addTransaction,
  }) : super(key: key);

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final expenseTitleController = TextEditingController();

  final amountController = TextEditingController();

  final dateController = TextEditingController();

  late DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Your Expenses',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: expenseTitleController,
              decoration: InputDecoration(
                  labelText: "Enter expense name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  )),
            ),
            const SizedBox(height: 15),
            TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              onSubmitted: (_) => submitTnx(context),
              decoration: InputDecoration(
                  labelText: "Enter amount",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  )),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: dateController,
              enabled: true,
              readOnly: true,
              decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.calendar_month_outlined),
                  labelText: "Enter Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2),
                  )),
              onTap: () {
                _showDatePicker(context);
              },
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.bottomRight,
              child: OutlinedButton(
                  onPressed: () {
                    submitTnx(context);
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.purple,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void submitTnx(BuildContext context) {
    final expenseTitle = expenseTitleController.text;
    final expenseAmount = double.parse(amountController.text);
    final selectedDate = dateController.text;

    if (expenseTitle.isEmpty || expenseAmount <= 0 || selectedDate.isEmpty) {
      return;
    }

    widget.addTransaction(expenseTitle, expenseAmount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      } else {
        dateController.text = DateFormat.yMd().format(date);
        _selectedDate = date;
      }
    });
  }
}
