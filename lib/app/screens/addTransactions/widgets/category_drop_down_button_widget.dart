import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  // true for income, false for expense
  final Function(String selectedCategory) onChanged;
  final String? initialValue;

  const CategoryDropdown({
    super.key,
    required this.onChanged,
    this.initialValue,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  final List<String> _categories = [
    'Select Category',
    'Salary',
    'Business',
    'Investment',
    'Freelancing',
    'Gift',
    'Interest',
    'Food',
    'Home Expenses',
    'Transport',
    'Rent',
    'Shopping',
    'Groceries',
    'Utilities',
    'Health',
    'Entertainment',
    'Other'
  ];
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        // labelText: 'Select Category',
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(SizeConstant.getHeightWithScreen(10)),
        ),
      ),
      borderRadius: BorderRadius.circular(SizeConstant.getHeightWithScreen(10)),
      value: _selectedCategory,
      items: _categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() {
            _selectedCategory = value;
          });
          widget.onChanged(value);
        }
      },
      isExpanded: true,
      // underline: Container(height: 1, color: Colors.grey),
    );
  }
}
