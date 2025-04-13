class TransactionModel {
  String id;
  String type;
  String userId;
  String category;
  String transactionType;
  DateTime transactionDate;
  String transactionAmount;
  String transactionStatus;
  String transactionDescription;

  TransactionModel({
    required this.id,
    required this.type,
    required this.userId,
    required this.category,
    required this.transactionType,
    required this.transactionDate,
    required this.transactionAmount,
    required this.transactionStatus,
    required this.transactionDescription,
  });

  TransactionModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        type = json['type'] ?? '',
        userId = json['user_id'] ?? '',
        category = json['category'] ?? '',
        transactionType = json['transaction_type'] ?? '',
        transactionDate = json['transaction_date'] ?? '',
        transactionAmount = json['transaction_amount'] ?? '',
        transactionStatus = json['transaction_status'] ?? '',
        transactionDescription = json['transaction_description'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['user_id'] = userId;
    data['category'] = category;
    data['transaction_type'] = transactionType;
    data['transaction_date'] = transactionDate;
    data['transaction_amount'] = transactionAmount;
    data['transaction_status'] = transactionStatus;
    data['transaction_description'] = transactionDescription;
    return data;
  }
}
