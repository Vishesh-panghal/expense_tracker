import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.start, // it is from Top to Bottom Horizontally
        crossAxisAlignment:
            CrossAxisAlignment.center, // it is from Left to Right Vertically
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(color: Colors.blue, elevation: 10, child: Text('Card')),
          ),
          Card(
            color: Colors.amber,
            child: Text('List of Transitions..💵'),
          )
        ],
      ),
    );
  }
}
