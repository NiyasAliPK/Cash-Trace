// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_cloud_firestore_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$transactionRepositoryHash() =>
    r'31e53bde2cd20cda40a2b5caa9bc93a81d3478cd';

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
String _$singleTransactionHash() => r'91fd1942df2ffeb5597d7b5c9cea98d67cc3d781';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [singleTransaction].
@ProviderFor(singleTransaction)
const singleTransactionProvider = SingleTransactionFamily();

/// See also [singleTransaction].
class SingleTransactionFamily extends Family<AsyncValue<TransactionModel>> {
  /// See also [singleTransaction].
  const SingleTransactionFamily();

  /// See also [singleTransaction].
  SingleTransactionProvider call(
    String id,
  ) {
    return SingleTransactionProvider(
      id,
    );
  }

  @override
  SingleTransactionProvider getProviderOverride(
    covariant SingleTransactionProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'singleTransactionProvider';
}

/// See also [singleTransaction].
class SingleTransactionProvider
    extends AutoDisposeFutureProvider<TransactionModel> {
  /// See also [singleTransaction].
  SingleTransactionProvider(
    String id,
  ) : this._internal(
          (ref) => singleTransaction(
            ref as SingleTransactionRef,
            id,
          ),
          from: singleTransactionProvider,
          name: r'singleTransactionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleTransactionHash,
          dependencies: SingleTransactionFamily._dependencies,
          allTransitiveDependencies:
              SingleTransactionFamily._allTransitiveDependencies,
          id: id,
        );

  SingleTransactionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<TransactionModel> Function(SingleTransactionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SingleTransactionProvider._internal(
        (ref) => create(ref as SingleTransactionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<TransactionModel> createElement() {
    return _SingleTransactionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SingleTransactionProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SingleTransactionRef on AutoDisposeFutureProviderRef<TransactionModel> {
  /// The parameter `id` of this provider.
  String get id;
}

class _SingleTransactionProviderElement
    extends AutoDisposeFutureProviderElement<TransactionModel>
    with SingleTransactionRef {
  _SingleTransactionProviderElement(super.provider);

  @override
  String get id => (origin as SingleTransactionProvider).id;
}

String _$transactionsHash() => r'42504cfe3fbc12feae9b142965a225fd2a90b9fc';

/// See also [transactions].
@ProviderFor(transactions)
final transactionsProvider = StreamProvider<List<TransactionModel>>.internal(
  transactions,
  name: r'transactionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$transactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionsRef = StreamProviderRef<List<TransactionModel>>;
String _$transactionsWithFilterHash() =>
    r'b9b43daaf265d0027fa43a15dfb0e39baa8165f6';

/// See also [transactionsWithFilter].
@ProviderFor(transactionsWithFilter)
const transactionsWithFilterProvider = TransactionsWithFilterFamily();

/// See also [transactionsWithFilter].
class TransactionsWithFilterFamily
    extends Family<AsyncValue<List<TransactionModel>>> {
  /// See also [transactionsWithFilter].
  const TransactionsWithFilterFamily();

  /// See also [transactionsWithFilter].
  TransactionsWithFilterProvider call({
    String? type,
    List<String>? categories,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return TransactionsWithFilterProvider(
      type: type,
      categories: categories,
      startDate: startDate,
      endDate: endDate,
    );
  }

  @override
  TransactionsWithFilterProvider getProviderOverride(
    covariant TransactionsWithFilterProvider provider,
  ) {
    return call(
      type: provider.type,
      categories: provider.categories,
      startDate: provider.startDate,
      endDate: provider.endDate,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'transactionsWithFilterProvider';
}

/// See also [transactionsWithFilter].
class TransactionsWithFilterProvider
    extends StreamProvider<List<TransactionModel>> {
  /// See also [transactionsWithFilter].
  TransactionsWithFilterProvider({
    String? type,
    List<String>? categories,
    DateTime? startDate,
    DateTime? endDate,
  }) : this._internal(
          (ref) => transactionsWithFilter(
            ref as TransactionsWithFilterRef,
            type: type,
            categories: categories,
            startDate: startDate,
            endDate: endDate,
          ),
          from: transactionsWithFilterProvider,
          name: r'transactionsWithFilterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionsWithFilterHash,
          dependencies: TransactionsWithFilterFamily._dependencies,
          allTransitiveDependencies:
              TransactionsWithFilterFamily._allTransitiveDependencies,
          type: type,
          categories: categories,
          startDate: startDate,
          endDate: endDate,
        );

  TransactionsWithFilterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
    required this.categories,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final String? type;
  final List<String>? categories;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  Override overrideWith(
    Stream<List<TransactionModel>> Function(TransactionsWithFilterRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransactionsWithFilterProvider._internal(
        (ref) => create(ref as TransactionsWithFilterRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
        categories: categories,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  StreamProviderElement<List<TransactionModel>> createElement() {
    return _TransactionsWithFilterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsWithFilterProvider &&
        other.type == type &&
        other.categories == categories &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);
    hash = _SystemHash.combine(hash, categories.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransactionsWithFilterRef on StreamProviderRef<List<TransactionModel>> {
  /// The parameter `type` of this provider.
  String? get type;

  /// The parameter `categories` of this provider.
  List<String>? get categories;

  /// The parameter `startDate` of this provider.
  DateTime? get startDate;

  /// The parameter `endDate` of this provider.
  DateTime? get endDate;
}

class _TransactionsWithFilterProviderElement
    extends StreamProviderElement<List<TransactionModel>>
    with TransactionsWithFilterRef {
  _TransactionsWithFilterProviderElement(super.provider);

  @override
  String? get type => (origin as TransactionsWithFilterProvider).type;
  @override
  List<String>? get categories =>
      (origin as TransactionsWithFilterProvider).categories;
  @override
  DateTime? get startDate =>
      (origin as TransactionsWithFilterProvider).startDate;
  @override
  DateTime? get endDate => (origin as TransactionsWithFilterProvider).endDate;
}

String _$transactionsByCategoryHash() =>
    r'01d4029663f089e2e53b9b183b67a48327c45e24';

/// See also [transactionsByCategory].
@ProviderFor(transactionsByCategory)
const transactionsByCategoryProvider = TransactionsByCategoryFamily();

/// See also [transactionsByCategory].
class TransactionsByCategoryFamily
    extends Family<AsyncValue<List<TransactionModel>>> {
  /// See also [transactionsByCategory].
  const TransactionsByCategoryFamily();

  /// See also [transactionsByCategory].
  TransactionsByCategoryProvider call(
    String category,
  ) {
    return TransactionsByCategoryProvider(
      category,
    );
  }

  @override
  TransactionsByCategoryProvider getProviderOverride(
    covariant TransactionsByCategoryProvider provider,
  ) {
    return call(
      provider.category,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'transactionsByCategoryProvider';
}

/// See also [transactionsByCategory].
class TransactionsByCategoryProvider
    extends AutoDisposeStreamProvider<List<TransactionModel>> {
  /// See also [transactionsByCategory].
  TransactionsByCategoryProvider(
    String category,
  ) : this._internal(
          (ref) => transactionsByCategory(
            ref as TransactionsByCategoryRef,
            category,
          ),
          from: transactionsByCategoryProvider,
          name: r'transactionsByCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionsByCategoryHash,
          dependencies: TransactionsByCategoryFamily._dependencies,
          allTransitiveDependencies:
              TransactionsByCategoryFamily._allTransitiveDependencies,
          category: category,
        );

  TransactionsByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final String category;

  @override
  Override overrideWith(
    Stream<List<TransactionModel>> Function(TransactionsByCategoryRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransactionsByCategoryProvider._internal(
        (ref) => create(ref as TransactionsByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<TransactionModel>> createElement() {
    return _TransactionsByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsByCategoryProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransactionsByCategoryRef
    on AutoDisposeStreamProviderRef<List<TransactionModel>> {
  /// The parameter `category` of this provider.
  String get category;
}

class _TransactionsByCategoryProviderElement
    extends AutoDisposeStreamProviderElement<List<TransactionModel>>
    with TransactionsByCategoryRef {
  _TransactionsByCategoryProviderElement(super.provider);

  @override
  String get category => (origin as TransactionsByCategoryProvider).category;
}

String _$transactionsByDateRangeHash() =>
    r'edf4e24c8e044cf0792d682a088356103162fb30';

/// See also [transactionsByDateRange].
@ProviderFor(transactionsByDateRange)
const transactionsByDateRangeProvider = TransactionsByDateRangeFamily();

/// See also [transactionsByDateRange].
class TransactionsByDateRangeFamily
    extends Family<AsyncValue<List<TransactionModel>>> {
  /// See also [transactionsByDateRange].
  const TransactionsByDateRangeFamily();

  /// See also [transactionsByDateRange].
  TransactionsByDateRangeProvider call(
    DateTime startDate,
    DateTime endDate,
  ) {
    return TransactionsByDateRangeProvider(
      startDate,
      endDate,
    );
  }

  @override
  TransactionsByDateRangeProvider getProviderOverride(
    covariant TransactionsByDateRangeProvider provider,
  ) {
    return call(
      provider.startDate,
      provider.endDate,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'transactionsByDateRangeProvider';
}

/// See also [transactionsByDateRange].
class TransactionsByDateRangeProvider
    extends AutoDisposeStreamProvider<List<TransactionModel>> {
  /// See also [transactionsByDateRange].
  TransactionsByDateRangeProvider(
    DateTime startDate,
    DateTime endDate,
  ) : this._internal(
          (ref) => transactionsByDateRange(
            ref as TransactionsByDateRangeRef,
            startDate,
            endDate,
          ),
          from: transactionsByDateRangeProvider,
          name: r'transactionsByDateRangeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionsByDateRangeHash,
          dependencies: TransactionsByDateRangeFamily._dependencies,
          allTransitiveDependencies:
              TransactionsByDateRangeFamily._allTransitiveDependencies,
          startDate: startDate,
          endDate: endDate,
        );

  TransactionsByDateRangeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.startDate,
    required this.endDate,
  }) : super.internal();

  final DateTime startDate;
  final DateTime endDate;

  @override
  Override overrideWith(
    Stream<List<TransactionModel>> Function(TransactionsByDateRangeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransactionsByDateRangeProvider._internal(
        (ref) => create(ref as TransactionsByDateRangeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<TransactionModel>> createElement() {
    return _TransactionsByDateRangeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsByDateRangeProvider &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, startDate.hashCode);
    hash = _SystemHash.combine(hash, endDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransactionsByDateRangeRef
    on AutoDisposeStreamProviderRef<List<TransactionModel>> {
  /// The parameter `startDate` of this provider.
  DateTime get startDate;

  /// The parameter `endDate` of this provider.
  DateTime get endDate;
}

class _TransactionsByDateRangeProviderElement
    extends AutoDisposeStreamProviderElement<List<TransactionModel>>
    with TransactionsByDateRangeRef {
  _TransactionsByDateRangeProviderElement(super.provider);

  @override
  DateTime get startDate =>
      (origin as TransactionsByDateRangeProvider).startDate;
  @override
  DateTime get endDate => (origin as TransactionsByDateRangeProvider).endDate;
}

String _$totalIncomeHash() => r'68eb9a058c13419db3dab154cf81b5efa1e05024';

/// See also [totalIncome].
@ProviderFor(totalIncome)
final totalIncomeProvider = FutureProvider<double>.internal(
  totalIncome,
  name: r'totalIncomeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totalIncomeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalIncomeRef = FutureProviderRef<double>;
String _$totalExpensesHash() => r'3f75cdd2421502c16b3c71ef024dee668bbc5a24';

/// See also [totalExpenses].
@ProviderFor(totalExpenses)
final totalExpensesProvider = FutureProvider<double>.internal(
  totalExpenses,
  name: r'totalExpensesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$totalExpensesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalExpensesRef = FutureProviderRef<double>;
String _$transactionNotifierHash() =>
    r'cc669f96fef62bae0d3d1cdf1425f9ce9379eb45';

/// See also [TransactionNotifier].
@ProviderFor(TransactionNotifier)
final transactionNotifierProvider = AutoDisposeNotifierProvider<
    TransactionNotifier, TransactionStates>.internal(
  TransactionNotifier.new,
  name: r'transactionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TransactionNotifier = AutoDisposeNotifier<TransactionStates>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
