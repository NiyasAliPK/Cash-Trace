import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/providers/firebase_cloud_firestore_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TotalAmountCard extends StatelessWidget {
  final String type;
  const TotalAmountCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      // borderRadius: BorderRadius.circular(8),
      elevation: 3,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(16)),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Consumer(
          builder: (context, ref, child) {
            return ref
                .watch(type == "Income"
                    ? totalIncomeProvider
                    : totalExpensesProvider)
                .when(
                  data: (data) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Total Amount',
                        style: TextStyle(
                            fontSize: SizeConstant.large25Font,
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          data.toString(),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: SizeConstant.heavyFont,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  error: (error, stackTrace) => Center(
                    child: Text("Oops...!"),
                  ),
                  loading: () => Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                );
          },
        ),
      ),
    );
  }
}
