import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category? _selectedCategory;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void _cancel() => Navigator.pop(context);

  void _addExpense() {
    final title = _titleController.text;
    final amount = double.tryParse(_valueController.text) ?? 0;

    final newExpense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate ?? DateTime.now(),
      category: _selectedCategory ?? Category.food,
    );

    widget.onCreated(newExpense);
    Navigator.pop(context);
  }

  Future<void> _pickDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() => _selectedDate = pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _valueController,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefix: Text('\$'),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No Date Chosen!'
                          : 'Picked: ${_selectedDate!.toLocal().toIso8601String().split('T')[0]}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: _pickDate,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          DropdownButton<Category>(
            value: _selectedCategory,
            hint: const Text('Select Category'),
            items: Category.values.map((category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(category.name.toUpperCase()),
              );
            }).toList(),
            onChanged: (newValue) => setState(() => _selectedCategory = newValue),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: _cancel, child: const Text('Cancel')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: _addExpense, child: const Text('Create')),
            ],
          ),
        ],
      ),
    );
  }
}
