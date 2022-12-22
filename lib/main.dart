import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widget/button.dart';
import '../widget/user_transaction.dart';

// !To run APP..📲
void main() => runApp(MyApp());

// TODO Statefull Widget or Stateless Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
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
  final titleController = TextEditingController();

  final amtcontroller = TextEditingController();

  void startNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){return NewTransaction(addTx)})
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // just like frame for a screen
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
              onPressed: () => {},
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
          UserTransaction()
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (() => {}),
          child: Icon(
            Icons.add,
          )),
    );
  }
}
