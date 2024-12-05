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

  String get title => _titleController.text;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked; 
      });
    }
  }

  void onAdd() {
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    Expense expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate ?? DateTime.now(),
      category: _selectedCategory ?? Category.food, 
    );

    widget.onCreated(expense);
    Navigator.pop(context);
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
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Expanded(
                    child: TextField(
                      keyboardType:  TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller: _valueController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        prefix: Text('\$ '),
                        label: Text('Amount'),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                              Expanded(child: 
            Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date: ${_selectedDate!.toLocal().toIso8601String().split('T')[0]}', // YYYY-MM-DD format
                  style: const TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () {
                    _selectDate(context);
                    print('Selected date: $_selectedDate'); 
                  },
                ),
              ],
            ),)
              ],
            ), 

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  DropdownButton<Category>(
                  value: _selectedCategory,
                  hint: const Text('Select Category'),
                  items: Category.values.map((Category category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(category.toString().split('.').last.toUpperCase()),
                    );
                  }).toList(),
                  onChanged: (Category? newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                ),
                Container(child: Row(
                  children: [
                    ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
                    const SizedBox(width: 20),
                    ElevatedButton(onPressed: onAdd, child: const Text('Create')),
                  ],
                ))
              ],
            )
        ],
      ),
    );
  }
}
