import 'package:cash_trace/app/models/common/filter_model.dart';
import 'package:cash_trace/app/models/common/transaction_model.dart';
import 'package:cash_trace/app/repo/cloud_firestore_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_provider.g.dart';

// Filter state provider
@riverpod
class TransactionFilterNotifier extends _$TransactionFilterNotifier {
  @override
  TransactionFilter build() {
    return const TransactionFilter();
  }

  void updateFilter({
    String? type,
    List<String>? categories,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    state = state.copyWith(
      type: type,
      categories: categories,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void resetFilter() {
    state = const TransactionFilter();
  }
}

// Repository provider (adjust based on your existing implementation)
@riverpod
TransactionRepository transactionRepository(ref) {
  return TransactionRepository();
}

// Filtered transactions provider
@riverpod
Stream<List<TransactionModel>> filteredTransactions(ref) {
  final filter = ref.watch(transactionFilterNotifierProvider);
  final repository = ref.watch(transactionRepositoryProvider);

  return repository.getFilteredTransactions(
    type: filter.type,
    categories: filter.categories,
    startDate: filter.startDate,
    endDate: filter.endDate,
  );
}
