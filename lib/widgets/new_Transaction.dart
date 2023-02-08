import 'package:flutter/material.dart';
//import '../models/transaction.dart';
//import 'transaction_list.dart';

class new_Transaction extends StatefulWidget {
  final Function addTranx;

  new_Transaction({super.key, required this.addTranx});

  @override
  State<new_Transaction> createState() => _new_TransactionState();
}

class _new_TransactionState extends State<new_Transaction> {
  final newtext = TextEditingController();
  final amount = TextEditingController();

  void submitData() {
    final submiText = newtext.text;
    var submiAmount = double.parse(amount.text);
    if (submiText.isEmpty || submiAmount < 0) return;
    widget.addTranx(
      submiText,
      submiAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Text'),
            controller: newtext,
            onSubmitted: (value) => {submitData()},
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amount,
            keyboardType: TextInputType.number,
            onSubmitted: (value) => {submitData()},
          ),
          ElevatedButton(
              child: Text('Submit your response'),
              onPressed: () {
                submitData();
              }),
        ],
      ),
    );
  }
}
