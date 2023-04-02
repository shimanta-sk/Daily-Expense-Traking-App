import 'package:flutter/material.dart';
//import '../models/transaction.dart';
//import 'transaction_list.dart';
import 'package:intl/intl.dart';

class new_Transaction extends StatefulWidget {
  final Function addTranx;

  new_Transaction({super.key, required this.addTranx});

  @override
  State<new_Transaction> createState() => _new_TransactionState();
}

class _new_TransactionState extends State<new_Transaction> {
  final newtext = TextEditingController();
  final amount = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void submitData() {
    final submiText = newtext.text;
    var submiAmount = double.parse(amount.text);
    if (submiText.isEmpty || submiAmount < 0) return;
    widget.addTranx(
      submiText,
      submiAmount,
      selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _pickedDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 3.0,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_pickedDate == null
                      ? 'no choosen date...'
                      : DateFormat.yMd().format(selectedDate)),
                  ElevatedButton(
                    child: Text('Picked a date'),
                    onPressed: _pickedDate,
                  )
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                  child: const Text('Submit your response'),
                  onPressed: () {
                    submitData();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
