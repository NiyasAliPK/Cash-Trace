import 'package:flutter/material.dart';

class RadioIncomeExpense extends StatefulWidget {
  final Function(bool value) onChanged;
  final bool initialValue; // true = income, false = expense

  const RadioIncomeExpense({
    super.key,
    required this.onChanged,
    this.initialValue = true,
  });

  @override
  State<RadioIncomeExpense> createState() => _RadioIncomeExpenseState();
}

class _RadioIncomeExpenseState extends State<RadioIncomeExpense> {
  late bool _isIncome;

  @override
  void initState() {
    super.initState();
    _isIncome = widget.initialValue;
  }

  void _onValueChanged(bool value) {
    setState(() {
      _isIncome = value;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio<bool>(
          value: true,
          groupValue: _isIncome,
          onChanged: (value) {
            if (value != null) _onValueChanged(value);
          },
        ),
        const Text('Income'),
        Radio<bool>(
          value: false,
          groupValue: _isIncome,
          onChanged: (value) {
            if (value != null) _onValueChanged(value);
          },
        ),
        const Text('Expense'),
      ],
    );
  }
}
