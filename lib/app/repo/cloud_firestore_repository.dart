import 'package:cash_trace/app/models/common/transaction_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Collection reference
  CollectionReference<Map<String, dynamic>> get _transactionsCollection {
    final userId = _auth.currentUser?.uid;
    if (userId == null) {
      throw Exception('User not authenticated');
    }

    // Using a structure where each user has their own transactions collection
    return _firestore.collection('users/$userId/transactions');
  }

  // Get current user ID
  String? get currentUserId => _auth.currentUser?.uid;

  // Get all transactions for the current user
Stream<List<TransactionModel>> getAllTransactions({String searchQuery = ''}) {
  var query = _transactionsCollection.orderBy('transaction_date', descending: true);
  
  // We don't modify the query since we'll filter in memory
  // Firestore doesn't support case-insensitive contains() queries directly
  
  return query.snapshots().map((snapshot) {
    var transactions = snapshot.docs.map((doc) {
      final data = doc.data();
      // Convert Timestamp to DateTime
      final timestamp = data['transaction_date'] as Timestamp;
      data['transaction_date'] = timestamp.toDate();

      // Create TransactionModel with ID from doc
      return TransactionModel.fromJson({...data, 'id': doc.id});
    }).toList();
    
    // Apply in-memory filtering if there's a search query
    if (searchQuery.isNotEmpty) {
      transactions = transactions.where((transaction) {
        final description = transaction.transactionDescription.toLowerCase() ;
        return description.contains(searchQuery.toLowerCase());
      }).toList();
    }
    
    return transactions;
  });
}

  // Add a new transaction
  Future<String> addTransaction(TransactionModel transaction) async {
    if (currentUserId == null) {
      throw Exception('User not authenticated');
    }

    // Ensure the transaction has the current userId
    transaction.userId = currentUserId!;

    // Convert DateTime to Timestamp for Firestore
    final data = transaction.toJson();
    data['transaction_date'] = Timestamp.fromDate(transaction.transactionDate);

    // Add to Firestore and get the auto-generated document ID
    final docRef = await _transactionsCollection.add(data);
    return docRef.id;
  }

  // Get a specific transaction
  Future<TransactionModel> getTransaction(String id) async {
    final docSnapshot = await _transactionsCollection.doc(id).get();

    if (!docSnapshot.exists) {
      throw Exception('Transaction not found');
    }

    final data = docSnapshot.data()!;

    // Convert Timestamp to DateTime
    final timestamp = data['transaction_date'] as Timestamp;
    data['transaction_date'] = timestamp.toDate();

    return TransactionModel.fromJson({...data, 'id': docSnapshot.id});
  }

  // Update a transaction
  Future<void> updateTransaction(TransactionModel transaction) async {
    if (transaction.id.isEmpty) {
      throw Exception('Transaction ID cannot be empty');
    }

    // Convert DateTime to Timestamp for Firestore
    final data = transaction.toJson();
    data['transaction_date'] = Timestamp.fromDate(transaction.transactionDate);

    await _transactionsCollection.doc(transaction.id).update(data);
  }

  // Delete a transaction
  Future<void> deleteTransaction(String id) async {
    await _transactionsCollection.doc(id).delete();
  }

// Get filtered transactions with optional parameters
Stream<List<TransactionModel>> getFilteredTransactions({
  String? type,
  List<String>? categories,
  DateTime? startDate,
  DateTime? endDate,
}) {
  Query<Map<String, dynamic>> query = _transactionsCollection;
  
  // Add type filter if provided
  if (type != null && type.isNotEmpty) {
    query = query.where('type', isEqualTo: type);
  }
  
  // Multi-category filter using whereIn
  if (categories != null && categories.isNotEmpty) {
    query = query.where('category', whereIn: categories);
  }
  
  // Date range filters
  if (startDate != null) {
    final startTimestamp = Timestamp.fromDate(startDate);
    query = query.where('transaction_date', isGreaterThanOrEqualTo: startTimestamp);
  }
  
  if (endDate != null) {
    final endTimestamp = Timestamp.fromDate(endDate);
    query = query.where('transaction_date', isLessThanOrEqualTo: endTimestamp);
  }
  
  // Always order by date, descending
  query = query.orderBy('transaction_date', descending: true);
  
  return query.snapshots().map((snapshot) {
    return snapshot.docs.map((doc) {
      final data = doc.data();
      final timestamp = data['transaction_date'] as Timestamp;
      data['transaction_date'] = timestamp.toDate();
      return TransactionModel.fromJson({...data, 'id': doc.id});
    }).toList();
  });
}

  // Get transactions by category
  Stream<List<TransactionModel>> getTransactionsByCategory(String category) {
    return _transactionsCollection
        .where('category', isEqualTo: category)
        .orderBy('transaction_date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        // Convert Timestamp to DateTime
        final timestamp = data['transaction_date'] as Timestamp;
        data['transaction_date'] = timestamp.toDate();

        return TransactionModel.fromJson({...data, 'id': doc.id});
      }).toList();
    });
  }

  // Get transactions by date range
  Stream<List<TransactionModel>> getTransactionsByDateRange(
      DateTime startDate, DateTime endDate) {
    // Convert to timestamp for Firestore query
    final startTimestamp = Timestamp.fromDate(startDate);
    final endTimestamp = Timestamp.fromDate(endDate);

    return _transactionsCollection
        .where('transaction_date', isGreaterThanOrEqualTo: startTimestamp)
        .where('transaction_date', isLessThanOrEqualTo: endTimestamp)
        .orderBy('transaction_date', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        // Convert Timestamp to DateTime
        final timestamp = data['transaction_date'] as Timestamp;
        data['transaction_date'] = timestamp.toDate();

        return TransactionModel.fromJson({...data, 'id': doc.id});
      }).toList();
    });
  }

  // Get total income
  Future<double> getTotalIncome() async {
    final snapshot =
        await _transactionsCollection.where('type', isEqualTo: 'Income').get();

    return _calculateTotal(snapshot.docs);
  }

  // Get total expenses
  Future<double> getTotalExpenses() async {
    final snapshot =
        await _transactionsCollection.where('type', isEqualTo: 'Expense').get();

    return _calculateTotal(snapshot.docs);
  }

  // Helper method to calculate total from documents
  double _calculateTotal(
      List<QueryDocumentSnapshot<Map<String, dynamic>>> docs) {
    double total = 0;
    for (var doc in docs) {
      final amount = doc.data()['transaction_amount'] ?? '0';
      total += double.tryParse(amount) ?? 0;
    }
    return total;
  }
}
