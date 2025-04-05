import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  TransactionType _selectedType = TransactionType.expense;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text) ?? 0;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) return;

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
      _selectedType,
    );

    Navigator.of(context).pop(); // Close modal
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() => _selectedDate = pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date chosen!'
                        : 'Picked Date: ${DateFormat.yMMMd().format(_selectedDate!)}',
                  ),
                ),
                TextButton(
                  onPressed: _presentDatePicker,
                  child: Text('Choose Date'),
                )
              ],
            ),
            DropdownButton<TransactionType>(
              value: _selectedType,
              items: [
                DropdownMenuItem(
                  child: Text('Expense'),
                  value: TransactionType.expense,
                ),
                DropdownMenuItem(
                  child: Text('Income'),
                  value: TransactionType.income,
                ),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() => _selectedType = val);
                }
              },
            ),
            ElevatedButton(
              child: Text('Add Transaction'),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
