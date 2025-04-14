// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionRepositoryHash() =>
    r'bb4e53116b0e03c7d3960a39f34dc79136efb60b';

/// See also [transactionRepository].
@ProviderFor(transactionRepository)
final transactionRepositoryProvider =
    AutoDisposeProvider<TransactionRepository>.internal(
  transactionRepository,
  name: r'transactionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionRepositoryRef
    = AutoDisposeProviderRef<TransactionRepository>;
String _$filteredTransactionsHash() =>
    r'c1e17250bf0c78eb72d1aa6b12b221f6839822a8';

/// See also [filteredTransactions].
@ProviderFor(filteredTransactions)
final filteredTransactionsProvider =
    AutoDisposeStreamProvider<List<TransactionModel>>.internal(
  filteredTransactions,
  name: r'filteredTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredTransactionsRef
    = AutoDisposeStreamProviderRef<List<TransactionModel>>;
String _$transactionFilterNotifierHash() =>
    r'7c38eb6cddfeb1084c982b9d1e64dabda269ef64';

/// See also [TransactionFilterNotifier].
@ProviderFor(TransactionFilterNotifier)
final transactionFilterNotifierProvider = AutoDisposeNotifierProvider<
    TransactionFilterNotifier, TransactionFilter>.internal(
  TransactionFilterNotifier.new,
  name: r'transactionFilterNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionFilterNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionFilterNotifier = AutoDisposeNotifier<TransactionFilter>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
