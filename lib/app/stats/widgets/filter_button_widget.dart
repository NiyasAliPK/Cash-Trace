import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FilterButton extends StatefulWidget {
  final Function(
          DateTime? start, DateTime? end, List<String> selectedCategories)
      onChanged;

  const FilterButton({super.key, required this.onChanged});

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  DateTime? _startDate;
  DateTime? _endDate;
  final List<String> _selectedCategories = [];

  final List<String> _categories = [
    'Salary',
    'Business',
    'Investment',
    'Freelancing',
    'Gift',
    'Interest',
    'Food',
    'Transport',
    'Rent',
    'Shopping',
    'Groceries',
    'Utilities',
    'Health',
    'Entertainment',
    'Other'
  ];

  void _openFilterSheet(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => StatefulBuilder(
        builder: (context, setModalState) {
          return Padding(
            padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(16)),
            child: SizedBox(
              height: SizeConstant.getHeightWithScreen(500),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Date Range Picker
                  Row(
                    children: [
                      Expanded(
                        child: TextButton.icon(
                            label: Text(_startDate == null || _endDate == null
                                ? "Select Date Range"
                                : "${DateFormat('dd MMM yyyy').format(_startDate!)} - ${DateFormat('dd MMM yyyy').format(_endDate!)}"),
                            onPressed: () async {
                              final picked = await showDateRangePicker(
                                context: context,
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                initialDateRange:
                                    _startDate != null && _endDate != null
                                        ? DateTimeRange(
                                            start: _startDate!, end: _endDate!)
                                        : null,
                              );

                              if (picked != null) {
                                setModalState(() {
                                  _startDate = picked.start;
                                  _endDate = picked.end;
                                });
                              }
                            },
                            icon: Icon(Icons.calendar_month_outlined)),
                      ),
                    ],
                  ),
                  const Divider(),

                  /// Multi Select Category Checkboxes
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: _categories.map((category) {
                        final isSelected =
                            _selectedCategories.contains(category);
                        return CheckboxListTile(
                          value: isSelected,
                          title: Text(category),
                          onChanged: (isChecked) {
                            setModalState(() {
                              if (isChecked == true) {
                                if (_selectedCategories.length < 10) {
                                  _selectedCategories.add(category);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "You can select up to 10 categories only."),
                                    ),
                                  );
                                }
                              } else {
                                _selectedCategories.remove(category);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// Buttons: Clear and Filter
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setModalState(() {
                            _startDate = null;
                            _endDate = null;
                            _selectedCategories.clear();
                            widget.onChanged(
                                _startDate, _endDate, _selectedCategories);
                          });
                        },
                        child: const Text("Clear"),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(elevation: 7
                            // backgroundColor: context.colors.secondary
                            ),
                        onPressed: () {
                          Navigator.pop(context);
                          widget.onChanged(
                              _startDate, _endDate, _selectedCategories);
                        },
                        icon: const Icon(Icons.done_rounded,
                            color: Colors.greenAccent),
                        label: const Text("Done"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.filter_list),
      label: Text(
        "Filter",
        style: TextStyle(
            fontSize: SizeConstant.mediumFont, fontWeight: FontWeight.bold),
      ),
      onPressed: () => _openFilterSheet(context),
    );
  }
}
