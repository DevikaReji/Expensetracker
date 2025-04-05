import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final double balance;
  final double income;
  final double expense;

  const SummaryCard({
    required this.balance,
    required this.income,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade50,
      margin: EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Total Balance',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('₹${balance.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent)),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Income'),
                    Text('₹${income.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: [
                    Text('Expense'),
                    Text('₹${expense.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
