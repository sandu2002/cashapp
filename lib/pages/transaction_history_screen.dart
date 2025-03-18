import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {'amount': '\$50.00', 'date': '2023-10-01', 'description': 'Sent to John'},
    {'amount': '\$20.00', 'date': '2023-10-02', 'description': 'Received from Jane'},
    // Add more transactions here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text(transaction['description']!),
            subtitle: Text(transaction['date']!),
            trailing: Text(transaction['amount']!),
          );
        },
      ),
    );
  }
}