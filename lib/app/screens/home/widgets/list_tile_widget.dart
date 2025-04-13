import 'dart:developer';

import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/models/common/transaction_model.dart';
import 'package:flutter/material.dart';
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
    log(transaction.transactionType.toLowerCase());
    final dateFormatted =
        DateFormat('MMM dd, yyyy').format(transaction.transactionDate);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConstant.getHeightWithScreen(12),
          vertical: SizeConstant.getHeightWithScreen(8)),
      child: Card(
        elevation: 3,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(8)),
          child: Row(
            spacing: SizeConstant.getHeightWithScreen(10),
            children: [
              CircleAvatar(
                backgroundColor:
                    isIncome ? Colors.greenAccent : Colors.redAccent,
                child: Icon(isIncome
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SizeConstant.getHeightWithScreen(5),
                children: [
                  SizedBox(
                    width: SizeConstant.getHeightWithScreen(220),
                    child: Text(
                      transaction.transactionDescription,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConstant.getHeightWithScreen(16)),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        dateFormatted,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey[600],
                            fontSize: SizeConstant.getHeightWithScreen(16)),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Text(transaction.transactionAmount,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: isIncome ? Colors.greenAccent : Colors.redAccent,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
