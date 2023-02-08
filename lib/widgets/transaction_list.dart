import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [
                  SizedBox(height: 15),
                  Text(
                    'No transaction added yet!',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    child: Image.asset(
                      'assets/images/zzz.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0)),
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            '\$${transactions[index].amount}',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transactions[index].title.toString(),
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat().format(transactions[index].date),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                itemCount: transactions.length,
              ));
  }
}
