import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dash_provider.g.dart';

@riverpod
class DashScreenNotifier extends _$DashScreenNotifier {
  @override
  int build() {
    // Initialize the state
    return 0; // Default to home tab (index 0)
  } // Start with home tab (index 0) selected

  // Method to update the selected tab
  void setTab(int index) {
    state = index;
  }
}

