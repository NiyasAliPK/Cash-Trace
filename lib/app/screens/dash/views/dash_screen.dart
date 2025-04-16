// lib/screens/dash_screen.dart
import 'package:cash_trace/app/contants/size_constants.dart';
import 'package:cash_trace/app/providers/dash_provider.dart';
import 'package:cash_trace/app/screens/home/view/home_screen.dart';
import 'package:cash_trace/app/stats/view/stats_screen.dart';
import 'package:cash_trace/app/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DashScreen extends ConsumerWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(dashScreenNotifierProvider);
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    final screens = [const HomeScreen(), const StatsScreen()];

    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(
        child: screens[selectedIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: !isKeyboardOpen && selectedIndex == 0, // Show only in Home tab
        child: FloatingActionButton(
          onPressed: () {
            context.pushNamed('add');
          },
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConstant.getHeightWithScreen(50)),
          ),
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (index) {
          ref.read(dashScreenNotifierProvider.notifier).setTab(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_list_outlined), label: 'Stats')
        ],
      ),
    );
  }
}

