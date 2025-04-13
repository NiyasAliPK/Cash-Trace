// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_cloud_firestore_provider.dart';

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
String _$transactionsHash() => r'5845e47c71ec0d38fdb9fe2c755ed7cb4302f20b';

/// See also [transactions].
@ProviderFor(transactions)
final transactionsProvider =
    AutoDisposeStreamProvider<List<TransactionModel>>.internal(
  transactions,
  name: r'transactionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$transactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionsRef = AutoDisposeStreamProviderRef<List<TransactionModel>>;
String _$transactionsByTypeHash() =>
    r'57d4459112e2f609079c60a8b93ea736c3014e62';

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

/// See also [transactionsByType].
@ProviderFor(transactionsByType)
const transactionsByTypeProvider = TransactionsByTypeFamily();

/// See also [transactionsByType].
class TransactionsByTypeFamily
    extends Family<AsyncValue<List<TransactionModel>>> {
  /// See also [transactionsByType].
  const TransactionsByTypeFamily();

  /// See also [transactionsByType].
  TransactionsByTypeProvider call(
    String type,
  ) {
    return TransactionsByTypeProvider(
      type,
    );
  }

  @override
  TransactionsByTypeProvider getProviderOverride(
    covariant TransactionsByTypeProvider provider,
  ) {
    return call(
      provider.type,
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
  String? get name => r'transactionsByTypeProvider';
}

/// See also [transactionsByType].
class TransactionsByTypeProvider
    extends AutoDisposeStreamProvider<List<TransactionModel>> {
  /// See also [transactionsByType].
  TransactionsByTypeProvider(
    String type,
  ) : this._internal(
          (ref) => transactionsByType(
            ref as TransactionsByTypeRef,
            type,
          ),
          from: transactionsByTypeProvider,
          name: r'transactionsByTypeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$transactionsByTypeHash,
          dependencies: TransactionsByTypeFamily._dependencies,
          allTransitiveDependencies:
              TransactionsByTypeFamily._allTransitiveDependencies,
          type: type,
        );

  TransactionsByTypeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final String type;

  @override
  Override overrideWith(
    Stream<List<TransactionModel>> Function(TransactionsByTypeRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TransactionsByTypeProvider._internal(
        (ref) => create(ref as TransactionsByTypeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<TransactionModel>> createElement() {
    return _TransactionsByTypeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TransactionsByTypeProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TransactionsByTypeRef
    on AutoDisposeStreamProviderRef<List<TransactionModel>> {
  /// The parameter `type` of this provider.
  String get type;
}

class _TransactionsByTypeProviderElement
    extends AutoDisposeStreamProviderElement<List<TransactionModel>>
    with TransactionsByTypeRef {
  _TransactionsByTypeProviderElement(super.provider);

  @override
  String get type => (origin as TransactionsByTypeProvider).type;
}

String _$transactionsByCategoryHash() =>
    r'07898130321c5ca10a6f780f1238134903858814';

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

String _$totalIncomeHash() => r'86430f8a43efc38ee27460ba46d0c14bfb9888e4';

/// See also [totalIncome].
@ProviderFor(totalIncome)
final totalIncomeProvider = AutoDisposeFutureProvider<double>.internal(
  totalIncome,
  name: r'totalIncomeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$totalIncomeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TotalIncomeRef = AutoDisposeFutureProviderRef<double>;
String _$totalExpensesHash() => r'8a46611b135c3944b1bbcd54361ea4717d8c22a1';

/// See also [totalExpenses].
@ProviderFor(totalExpenses)
final totalExpensesProvider = AutoDisposeFutureProvider<double>.internal(
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
typedef TotalExpensesRef = AutoDisposeFutureProviderRef<double>;
String _$transactionNotifierHash() =>
    r'bff401eb2dba53ff16b854271ee8fd50baceb774';

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
