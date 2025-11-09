class TransactionModel {
  final String title;
  final String amount;
  final DateTime date;
  final String iconPath; // tambahkan ini

  TransactionModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.iconPath,
  });
}
