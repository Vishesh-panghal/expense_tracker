import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.purpleAccent, width: 2)),
                  child: Text(
                    '\u{20B9}${transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColorDark,
                      // backgroundColor: Colors.amberAccent,
                    ), // amount is here..💵
                  )),
// title and date Container..👍
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
// !title and date is here..👍
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                  ],
                ),
              )
            ],
          ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
