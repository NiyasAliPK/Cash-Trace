import 'dart:developer';

import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/providers/filter_provider.dart';
import 'package:cash_trace/app/screens/home/widgets/list_tile_widget.dart';
import 'package:cash_trace/app/stats/widgets/filter_button_widget.dart';
import 'package:cash_trace/app/stats/widgets/total_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IncomeScreen extends ConsumerStatefulWidget {
  const IncomeScreen({super.key});

  @override
  ConsumerState<IncomeScreen> createState() => _IncomeScreenState();
}

class _IncomeScreenState extends ConsumerState<IncomeScreen> {
  @override
  void initState() {
    super.initState();
    // Set initial filter for Income when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(transactionFilterNotifierProvider.notifier)
          .updateFilter(type: "Income");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConstant.getHeightWithScreen(20)),
          child: TotalAmountCard(
            type: "Income",
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: FilterButton(
            onChanged: (start, end, selectedCategories) {
              log("Start: $start, End: $end, Categories: $selectedCategories");

              // Update filter state when filter button changes
              ref.read(transactionFilterNotifierProvider.notifier).updateFilter(
                    type: "Income", // Always filter by Income on this screen
                    startDate: start,
                    endDate: end,
                    categories: selectedCategories.isNotEmpty
                        ? selectedCategories
                        : null,
                  );
            },
          ),
        ),
        Expanded(
          child: ref.watch(filteredTransactionsProvider).when(
                data: (data) {
                  if (data.isEmpty) {
                    return const Center(child: Text("No transactions found"));
                  }
                  return ListView.separated(
                    padding: EdgeInsets.only(
                      bottom: SizeConstant.getHeightWithScreen(40),
                    ),
                    itemBuilder: (context, index) =>
                        TransactionTile(transaction: data[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: SizeConstant.getHeightWithScreen(10),
                    ),
                    itemCount: data.length,
                  );
                },
                error: (error, stackTrace) {
                  return Center(child: Text(error.toString()));
                },
                loading: () =>
                    const Center(child: CircularProgressIndicator.adaptive()),
              ),
        ),
      ],
    );
  }
}
