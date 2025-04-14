import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/stats/view/expense_screen.dart';
import 'package:cash_trace/app/stats/view/income_screen.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(SizeConstant.getHeightWithScreen(12)),
      child: Column(
        children: [
          TabBar(
            dividerColor: Colors.transparent,
            controller: tabController,
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConstant.mediumLargeFont),
            tabs: const [
              Tab(
                text: 'Income',
              ),
              Tab(
                text: 'Expense',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                IncomeScreen(),
                ExpenseScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
