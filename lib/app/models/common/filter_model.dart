class TransactionFilter {
  final String? type;
  final List<String>? categories;
  final DateTime? startDate;
  final DateTime? endDate;

  const TransactionFilter({
    this.type,
    this.categories,
    this.startDate,
    this.endDate,
  });

  TransactionFilter copyWith({
    String? type,
    List<String>? categories,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return TransactionFilter(
      type: type ?? this.type,
      categories: categories ?? this.categories,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}

// transaction_providers.dart

