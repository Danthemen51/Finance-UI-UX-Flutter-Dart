import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionItem({required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    final isIncome = transaction.amount.startsWith('+');
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          CircleAvatar(radius: 20, backgroundImage: AssetImage(transaction.iconPath)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(transaction.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(
                  DateFormat('MMM d • hh:mm a').format(transaction.date),
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            transaction.amount,
            style: TextStyle(color: isIncome ? Colors.greenAccent : const Color(0xFFFF6B6B), fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

class RecentTransactionList extends StatelessWidget {
  final List<TransactionModel> transactions;
  const RecentTransactionList({required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(bottom: 18),
        child: ListView.separated(
          itemCount: transactions.length,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) => TransactionItem(transaction: transactions[index]),
        ),
      ),
    );
  }
}