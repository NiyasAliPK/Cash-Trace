import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/models/common/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionDetailsScreen extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionDetailsScreen({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.transactionType.toLowerCase() == "income";
    final formattedDate =
        DateFormat('MMMM dd yyyy').format(transaction.transactionDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: SizeConstant.getHeightWithScreen(120)),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(16)),
          child: Card(
            elevation: 7,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _detailItem(
                      context: context,
                      'Amount',
                      transaction.transactionAmount,
                      valueColor: isIncome ? Colors.green : Colors.red),
                  _detailItem(
                      context: context, 'Type', transaction.transactionType),
                  _detailItem(
                      context: context, 'Category', transaction.category),
                  _detailItem(context: context, 'Date', formattedDate),
                  // _detailItem(
                  //     context: context,
                  //     'Status',
                  //     transaction.transactionStatus),
                  _detailItem(
                      context: context,
                      'Description',
                      transaction.transactionDescription),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailItem(String title, String value,
      {Color? valueColor, required BuildContext context}) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: SizeConstant.getHeightWithScreen(8)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: SizeConstant.getHeightWithScreen(120),
            child: Text(
              "$title: ",
              style: TextStyle(fontSize: SizeConstant.mediumFont),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  color: valueColor,
                  fontSize: SizeConstant.mediumLargeFont,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
