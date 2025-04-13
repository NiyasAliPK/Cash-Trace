// lib/screens/dash_screen.dart
import 'package:cash_trace/app/screens/home/view/home_screen.dart';
import 'package:cash_trace/app/providers/dash_provider.dart';
import 'package:cash_trace/app/stats/view/stats_screen.dart';
import 'package:cash_trace/app/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class DashScreen extends ConsumerWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the bottom nav provider to get the current selected index
    final selectedIndex = ref.watch(dashScreenNotifierProvider);

    // Content for each tab
    final screens = [HomeScreen(), StatsScreen()];

    return Scaffold(
      appBar: const CommonAppbar(),
      body: SafeArea(
        child: screens[selectedIndex], // Display the selected screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex, // Set the current selected index
        onTap: (index) {
          // Update the selected index using the provider
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
