import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widget/list.dart';
import './models/transaction.dart';
import 'package:flutter_complete_guide/widget/button.dart';
import './widget/list.dart';

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
          accentColor: Colors.amber,
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
// transitions from transition.dart file
  // final titleController = TextEditingController();
  // final amtcontroller = TextEditingController();

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

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: (() => {}),
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
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
        // mainAxisAlignment: MainAxisAlignment
        //     .spaceAround, // it is from Top to Bottom Horizontally
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // it is from Left to Right Vertically
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(color: Colors.blue, elevation: 10, child: Text('Card')),
          ),
          TransactionList(_userTransaction),
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
