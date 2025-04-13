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

class AddTransactionScreen extends ConsumerWidget {
  AddTransactionScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController descController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  String selectedCategory = '';
  DateTime selectedDate = DateTime.now();
  String seletedTransactionType = 'Income';

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<TransactionStates>(
      transactionNotifierProvider,
      (previous, next) {
        if (next == TransactionStates.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Transaction added successfully")),
          );
          _resetFields();
        } else if (next == TransactionStates.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Error adding transaction")),
          );
        }
      },
    );
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(16)),
        child: SingleChildScrollView(
            child: Column(
          spacing: SizeConstant.getHeightWithScreen(20),
          children: [
            SizedBox(height: SizeConstant.getHeightWithScreen(30)),
            Text(
              "Add Transaction",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: SizeConstant.getHeightWithScreen(30),
                bottom: SizeConstant.getHeightWithScreen(30),
              ),
              child: RadioIncomeExpense(onChanged: (value) {
                seletedTransactionType = value ? 'Icome' : 'Expense';
              }),
            ),
            CategoryDropdown(
              onChanged: (value) {
                selectedCategory = value;
              },
            ),
            DatePickerField(
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
                          id: DateTime.now().microsecondsSinceEpoch.toString(),
                          type: seletedTransactionType,
                          userId: user?.uid.toString() ?? 'null',
                          category: selectedCategory,
                          transactionType: seletedTransactionType,
                          transactionDate: selectedDate,
                          transactionAmount: amountController.text,
                          transactionStatus: 'TODO',
                          transactionDescription: descController.text);
                      ref
                          .read(transactionNotifierProvider.notifier)
                          .addTransaction(transaction);
                    }
                  },
                  child: currentState == TransactionStates.loading
                      ? CircularProgressIndicator.adaptive()
                      : Text(
                          "Add Transaction",
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
    selectedCategory = '';
    selectedDate = DateTime.now();
    seletedTransactionType = '';
  }
}
