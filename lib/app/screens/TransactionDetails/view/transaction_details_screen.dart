import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/models/common/transaction_model.dart';
import 'package:cash_trace/app/providers/firebase_cloud_firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        title: Text(
          'Transaction Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
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
              padding: EdgeInsets.only(
                  left: SizeConstant.getHeightWithScreen(16),
                  right: SizeConstant.getHeightWithScreen(16),
                  bottom: SizeConstant.getHeightWithScreen(16)),
              child: Consumer(
                builder: (context, ref, child) {
                  return ref
                      .watch(singleTransactionProvider(transaction.id))
                      .when(
                          data: (data) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton.icon(
                                        onPressed: () async {
                                          final Map<String, dynamic> extras = {
                                            'transaction': data,
                                            'isEditMode': true,
                                          };

                                          final result =
                                              await context.pushNamed(
                                            "add",
                                            extra: extras,
                                          );

                                          // Check if edit was successful
                                          if (result == true) {
                                            // Refetch the provider to reload the data
                                            ref.invalidate(
                                                singleTransactionProvider(
                                                    transaction.id));
                                          }
                                        },
                                        label: Text("Edit"),
                                        icon: Icon(Icons.edit)),
                                  ),
                                  _detailItem(
                                      context: context,
                                      'Amount',
                                      data.transactionAmount,
                                      valueColor:
                                          isIncome ? Colors.green : Colors.red),
                                  _detailItem(
                                      context: context,
                                      'Type',
                                      data.transactionType),
                                  _detailItem(
                                      context: context,
                                      'Category',
                                      data.category),
                                  _detailItem(
                                      context: context, 'Date', formattedDate),
                                  // _detailItem(
                                  //     context: context,
                                  //     'Status',
                                  //     data.transactionStatus),
                                  _detailItem(
                                      context: context,
                                      'Description',
                                      data.transactionDescription),
                                ],
                              ),
                          error: (error, stackTrace) => SizedBox(
                              height: SizeConstant.getHeightWithScreen(200),
                              child: Center(
                                child: Text(error.toString()),
                              )),
                          loading: () => SizedBox(
                                height: SizeConstant.getHeightWithScreen(200),
                                child: Center(
                                  child: CircularProgressIndicator.adaptive(),
                                ),
                              ));
                },
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
