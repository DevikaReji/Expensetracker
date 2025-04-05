import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final Function deleteTx;

  const TransactionItem({
    required this.transaction,
    required this.deleteTx,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: transaction.type == TransactionType.income
              ? Colors.green
              : Colors.red,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text('₹${transaction.amount}',
                  style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
          onPressed: () => deleteTx(transaction.id),
        ),
      ),
    );
  }
}
