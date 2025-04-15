import 'package:cash_trace/app/contants/common_enums.dart';
import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/models/common/transaction_model.dart';
import 'package:cash_trace/app/providers/firebase_cloud_firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionTile({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.transactionType.toLowerCase() == "income";
    final dateFormatted =
        DateFormat('MMM-dd-yyyy').format(transaction.transactionDate);

    return GestureDetector(
      onTap: () {
        context.pushNamed("details", extra: transaction);
      },
      child: Card(
        elevation: 3,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(8)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor:
                    isIncome ? Colors.greenAccent : Colors.redAccent,
                child: Icon(
                  isIncome
                      ? Icons.arrow_upward_rounded
                      : Icons.arrow_downward_rounded,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: SizeConstant.getHeightWithScreen(10)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      transaction.transactionDescription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConstant.largeFont,
                          ),
                    ),
                    SizedBox(height: SizeConstant.getHeightWithScreen(5)),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          dateFormatted,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                color: const Color.fromARGB(255, 148, 148, 148),
                                fontSize: SizeConstant.mediumLargeFont,
                              ),
                        ),
                        SizedBox(width: SizeConstant.getHeightWithScreen(10)),
                        Expanded(
                          child: Text(
                            transaction.category,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromARGB(255, 104, 104, 104),
                                  fontSize: SizeConstant.mediumLargeFont,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                constraints: BoxConstraints(
                  maxWidth: SizeConstant.getHeightWithScreen(70),
                ),
                child: Text(
                  transaction.transactionAmount,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    color: isIncome
                        ? const Color.fromARGB(255, 89, 219, 156)
                        : Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConstant.largeFont,
                  ),
                ),
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.more_vert),
                onSelected: (value) {
                  if (value == 'edit') {
                    final Map<String, dynamic> extras = {
                      'transaction': transaction,
                      'isEditMode': true,
                    };

                    context.pushNamed(
                      "add",
                      extra: extras,
                    );
                  } else if (value == 'delete') {
                    showDialog(
                      context: context,
                      builder: (context) => Consumer(
                        builder: (context, ref, child) {
                          final currentState =
                              ref.watch(transactionNotifierProvider);
                          ref.listen<TransactionStates>(
                            transactionNotifierProvider,
                            (previous, next) {
                              if (next == TransactionStates.success) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Transaction deleted successfully")),
                                );
                                context.pop();
                              }
                            },
                          );
                          return AlertDialog(
                            title: Text('Confirm Delete',
                                style: TextStyle(
                                    fontSize: SizeConstant.largeFont,
                                    fontWeight: FontWeight.bold)),
                            content: Text(
                              'Are you sure you want to delete this transaction?',
                              style:
                                  TextStyle(fontSize: SizeConstant.mediumFont),
                            ),
                            actions: currentState == TransactionStates.loading
                                ? [
                                    Center(
                                        child: CircularProgressIndicator
                                            .adaptive())
                                  ]
                                : [
                                    TextButton(
                                      onPressed: () {
                                        context.pop();
                                      },
                                      child: Text('No'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        ref
                                            .read(transactionNotifierProvider
                                                .notifier)
                                            .deleteTransaction(transaction.id);
                                      },
                                      child: Text('Yes'),
                                    ),
                                  ],
                          );
                        },
                      ),
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit, size: 18),
                        SizedBox(width: 8),
                        Text('Edit'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, size: 18),
                        SizedBox(width: 8),
                        Text('Delete'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
