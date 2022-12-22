import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amtcontroller = TextEditingController();

  void SubmitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amtcontroller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return // text field is here..⬇
        Card(
      margin: EdgeInsets.all(4),
      elevation: 3,
      child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Thing you buy'),
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => SubmitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: amtcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => SubmitData(),
            ),
// ! Add transaction button..🔅
            TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.blueAccent),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: SubmitData),
          ],
        ),
      ),
    );
  }
}
