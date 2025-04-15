import 'package:cash_trace/app/contants/common_enums.dart';
import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/models/common/transaction_model.dart';
import 'package:cash_trace/app/providers/auth_provider.dart';
import 'package:cash_trace/app/providers/firebase_cloud_firestore_provider.dart';
import 'package:cash_trace/app/screens/addTransactions/widgets/category_drop_down_button_widget.dart';
import 'package:cash_trace/app/screens/addTransactions/widgets/date_picker_widget.dart';
import 'package:cash_trace/app/screens/addTransactions/widgets/income_expense_radio_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  final bool isEditMode;
  final TransactionModel? transaction;
  const AddTransactionScreen(
      {super.key, this.isEditMode = false, this.transaction});

  @override
  ConsumerState<AddTransactionScreen> createState() =>
      _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController descController = TextEditingController();

  final TextEditingController amountController = TextEditingController();

  String selectedCategory = 'Select Category';

  DateTime selectedDate = DateTime.now();

  String seletedTransactionType = 'Income';

  @override
  Widget build(BuildContext context) {
    if (widget.isEditMode) {
      _setExistingTransactionData();
    }
    ref.listen<TransactionStates>(
      transactionNotifierProvider,
      (previous, next) async {
        if (next == TransactionStates.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Transaction ${widget.isEditMode ? "updated" : "added"} successfully")),
          );
          if (widget.isEditMode) {
            context.pop(true);
          }
          _resetFields();
        } else if (next == TransactionStates.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Error ${widget.isEditMode ? "updating" : "adding"} transaction")),
          );
        }
      },
    );
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(16)),
        child: SingleChildScrollView(
            child: Column(
          spacing: SizeConstant.getHeightWithScreen(20),
          children: [
            SizedBox(height: SizeConstant.getHeightWithScreen(30)),
            Text(
              "${widget.isEditMode ? "Update" : "Add"} Transaction",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConstant.getHeightWithScreen(30),
                bottom: SizeConstant.getHeightWithScreen(30),
              ),
              child: RadioIncomeExpense(
                  key: Key(seletedTransactionType),
                  initialValue:
                      seletedTransactionType == "Income" ? true : false,
                  onChanged: (value) {
                    seletedTransactionType = value ? 'Income' : 'Expense';
                  }),
            ),
            CategoryDropdown(
              key: Key(selectedCategory),
              initialValue: selectedCategory,
              onChanged: (value) {
                selectedCategory = value;
              },
            ),
            DatePickerField(
              key: Key(selectedDate.toIso8601String()),
              initialDate: selectedDate,
              onChanged: (value) {
                selectedDate = value;
              },
            ),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: descController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a description';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Transaction Description",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: SizeConstant.getHeightWithScreen(20),
                    ),
                    TextFormField(
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Amount",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                )),
            Consumer(builder: (context, ref, child) {
              final currentState = ref.watch(transactionNotifierProvider);
              return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 7,
                    minimumSize: Size(SizeConstant.getHeightWithScreen(180),
                        SizeConstant.getHeightWithScreen(50)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        SizeConstant.getHeightWithScreen(7),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (selectedCategory.isEmpty ||
                        selectedCategory == "Select Category") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("Please select a category"),
                        ),
                      );
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      var user = ref.read(userProvider);
                      var transaction = TransactionModel(
                          id: widget.isEditMode
                              ? widget.transaction!.id
                              : DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString(),
                          type: seletedTransactionType,
                          userId: widget.isEditMode
                              ? widget.transaction!.userId
                              : user?.uid.toString() ?? 'null',
                          category: selectedCategory,
                          transactionType: seletedTransactionType,
                          transactionDate: selectedDate,
                          transactionAmount: amountController.text,
                          transactionStatus: 'TODO',
                          transactionDescription: descController.text);

                      if (widget.isEditMode) {
                        if (!_isTransactionChanged()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("No changes found"),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }
                        ref
                            .read(transactionNotifierProvider.notifier)
                            .updateTransaction(transaction);
                      } else {
                        ref
                            .read(transactionNotifierProvider.notifier)
                            .addTransaction(transaction);
                      }
                    }
                  },
                  child: currentState == TransactionStates.loading
                      ? CircularProgressIndicator.adaptive()
                      : Text(
                          "${widget.isEditMode ? "update" : "Add"} Transaction",
                          style: TextStyle(fontSize: SizeConstant.largeFont),
                        ));
            })
          ],
        )),
      )),
    );
  }

  _resetFields() {
    descController.clear();
    amountController.clear();
    selectedCategory = 'Select Category';
    selectedDate = DateTime.now();
    seletedTransactionType = 'Income';
    setState(() {});
  }

  void _setExistingTransactionData() {
    descController.text = widget.transaction?.transactionDescription ?? '';
    amountController.text = widget.transaction?.transactionAmount ?? '';
    selectedCategory = widget.transaction?.category ?? 'Select Category';
    selectedDate = widget.transaction?.transactionDate ?? DateTime.now();
    seletedTransactionType = widget.transaction?.transactionType ?? 'Income';
  }

  bool _isTransactionChanged() {
    if (widget.transaction == null) return true;

    // Compare all fields that can be edited
    return descController.text != widget.transaction!.transactionDescription ||
        amountController.text != widget.transaction!.transactionAmount ||
        selectedCategory != widget.transaction!.category ||
        selectedDate.day != widget.transaction!.transactionDate.day ||
        selectedDate.month != widget.transaction!.transactionDate.month ||
        selectedDate.year != widget.transaction!.transactionDate.year ||
        seletedTransactionType != widget.transaction!.transactionType;
  }
}
