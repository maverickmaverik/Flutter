import 'package:flutter/material.dart';
import 'package:expense_app/expense.dart';

class NewExpense extends StatefulWidget {
  final void Function(Expense) onAddExpense;

  const NewExpense({super.key, required this.onAddExpense});
  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
  ExpenseType? selectedExpenseType;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, 1);
    final lastDate = DateTime(now.year, now.month + 1, 0);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _submitExpenses() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text);
    final isAmountInvalid = enteredAmount == null || enteredAmount <= 0;

    if (enteredTitle.isEmpty ||
        isAmountInvalid ||
        selectedDate == null ||
        selectedExpenseType == null) {
      // Show error dialog
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure a valid title, amount, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: amountController,
            decoration: const InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(selectedDate == null
                  ? 'No Date Chosen!'
                  : formatter.format(selectedDate!)),
              const Spacer(),
              TextButton(
                onPressed: _presentDatePicker,
                child: const Text('Choose Date'),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton<ExpenseType>(
                value: selectedExpenseType,
                items: ExpenseType.values
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.name.toUpperCase()),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    selectedExpenseType = value;
                  });
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpenses,
                child: const Text('Submit'),
              ),
              const SizedBox(width: 10),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
