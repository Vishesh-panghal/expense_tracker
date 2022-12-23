import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amtcontroller = TextEditingController();
  DateTime _selectedDate;

  void _SubmitData() {
    if (amtcontroller.text.isEmpty) {
      return;
    }
    final _enteredTitle = titleController.text;
    final _enteredAmount = double.parse(amtcontroller.text);
    if (_enteredTitle.isEmpty || _enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(_enteredTitle, _enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              onSubmitted: (_) => _SubmitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Price'),
              controller: amtcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _SubmitData(),
            ),
            Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? 'No date Chosen💤'
                          : 'Picked Date:${DateFormat.yMd().format(_selectedDate)}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
// ! Add transaction button..🔅
            Container(
              // margin: EdgeInsets.symmetric(vertical: 50, horizontal: 4),
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorDark),
                  child: Text(
                    'Add Transaction',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: _SubmitData),
            ),
          ],
        ),
      ),
    );
  }
}
