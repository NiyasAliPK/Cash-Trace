// lib/app/providers/transaction_provider.dart
import 'package:cash_trace/app/contants/common_enums.dart';
import 'package:cash_trace/app/models/common/transaction_model.dart';
import 'package:cash_trace/app/repo/cloud_firestore_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_cloud_firestore_provider.g.dart';

// Repository provider
@riverpod
TransactionRepository transactionRepository(Ref ref) {
  return TransactionRepository();
}

@riverpod
Future<TransactionModel> singleTransaction(Ref ref, String id) async {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getTransaction(id);
}

// Provider to get all transactions as a stream
@Riverpod(keepAlive: true)
Stream<List<TransactionModel>> transactions(Ref ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getAllTransactions();
}

// Provider to get transactions by type (income/expense)
@Riverpod(keepAlive: true)
Stream<List<TransactionModel>> transactionsWithFilter(
  Ref ref, {
  String? type,
  List<String>? categories,
  DateTime? startDate,
  DateTime? endDate,
}) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getFilteredTransactions(
      type: type,
      endDate: endDate,
      startDate: startDate,
      categories: categories);
}

// Provider to get transactions by category
@riverpod
Stream<List<TransactionModel>> transactionsByCategory(
    Ref ref, String category) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getTransactionsByCategory(category);
}

// Provider to get transactions by date range
@riverpod
Stream<List<TransactionModel>> transactionsByDateRange(
    ref, DateTime startDate, DateTime endDate) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getTransactionsByDateRange(startDate, endDate);
}

// Provider for total income
@Riverpod(keepAlive: true)
Future<double> totalIncome(Ref ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getTotalIncome();
}

// Provider for total expenses
@Riverpod(keepAlive: true)
Future<double> totalExpenses(Ref ref) {
  final repository = ref.watch(transactionRepositoryProvider);
  return repository.getTotalExpenses();
}

// Notifier for managing transaction operations
@riverpod
class TransactionNotifier extends _$TransactionNotifier {
  @override
  TransactionStates build() {
    return TransactionStates.initial;
  }

  late TransactionStates currentState;
  // Method to add a new transaction
  Future<String> addTransaction(TransactionModel transaction) async {
    final repository = ref.read(transactionRepositoryProvider);
    try {
      state = TransactionStates.loading;
      final id = await repository.addTransaction(transaction);

      // Invalidate the transactions providers to refresh the UI
      ref.invalidate(transactionsProvider);
      ref.invalidate(transactionsWithFilterProvider);
      ref.invalidate(totalIncomeProvider);
      ref.invalidate(totalExpensesProvider);
      state = TransactionStates.success;

      return id;
    } catch (e) {
      state = TransactionStates.error;

      rethrow;
    }
  }

  // Method to update an existing transaction
  Future<void> updateTransaction(TransactionModel transaction) async {
    final repository = ref.read(transactionRepositoryProvider);
    try {
      state = TransactionStates.loading;

      await repository.updateTransaction(transaction);

      // Invalidate providers
      ref.invalidate(transactionsProvider);
      ref.invalidate(transactionsWithFilterProvider);
      ref.invalidate(totalIncomeProvider);
      ref.invalidate(totalExpensesProvider);
      state = TransactionStates.success;
    } catch (e) {
      state = TransactionStates.error;

      rethrow;
    }
  }

  // Method to delete a transaction
  Future<void> deleteTransaction(String id) async {
    final repository = ref.read(transactionRepositoryProvider);
    try {
      state = TransactionStates.loading;

      await repository.deleteTransaction(id);

      // Invalidate providers
      ref.invalidate(transactionsProvider);
      ref.invalidate(transactionsWithFilterProvider);
      ref.invalidate(totalIncomeProvider);
      ref.invalidate(totalExpensesProvider);
      state = TransactionStates.success;
    } catch (e) {
      state = TransactionStates.error;

      rethrow;
    }
  }
}
