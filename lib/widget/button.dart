import 'package:flutter/material.dart';
import '../widget/user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amtcontroller = TextEditingController();

  NewTransaction(this.addTx);

  void SubmitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amtcontroller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(enteredTitle, enteredAmount);
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
