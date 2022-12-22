import 'package:flutter/material.dart';
import 'button.dart';
import 'list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
        id: 't1', title: 'Shoes', amount: 3000.00, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Jacket', amount: 1200.00, date: DateTime.now()),
  ];

  void _addNewTransaction(String txtitle, double txamount) {
    final newTnx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: DateTime.now());
    setState(() {
      _userTransaction.add(newTnx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
