import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widget/chart.dart';
import 'package:flutter_complete_guide/widget/list.dart';
import './models/transaction.dart';
import 'package:flutter_complete_guide/widget/button.dart';

// !To run APP..📲
void main() => runApp(MyApp());

// TODO Statefull Widget or Stateless Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.brown,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: 't1', title: 'Shoes', amount: 3000.00, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'Jacket', amount: 1200.00, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((element) {
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txtitle, double txamount, DateTime chosenDate) {
    final newTnx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: chosenDate);
    setState(() {
      _userTransaction.add(newTnx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: (() => {
                FocusManager.instance.primaryFocus?.unfocus(),
              }),
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // just like frame for a screen
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => {_startNewTransaction(context)},
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // it is from Left to Right Vertically
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Chart(_recentTransactions),
            // child: Text('Chart'),
          ),
          TransactionList(_userTransaction, _deleteTransaction),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {_startNewTransaction(context)},
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
