import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTnx;
  const TransactionList(
      {super.key, required this.transactions, required this.deleteTnx});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
        // height: 300,
        child: transactions.isEmpty
            ? Column(
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    'No transaction added yet!',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.center,
                    height: constraint.maxHeight * 0.5,
                    child: Image.asset(
                      'assets/images/zzz.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2.0)),
                          padding: const EdgeInsets.all(10.0),
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
                              style: const TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(width: 5),
                        MediaQuery.of(context).size.width > 460
                            ? Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.delete, color: Colors.red),
                                    onPressed: () =>
                                        deleteTnx(transactions[index].id),
                                  ),
                                  TextButton(
                                    child: Text('Delete'),
                                    onPressed: () =>
                                        deleteTnx(transactions[index].id),
                                  )
                                ],
                              )
                            : IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () =>
                                    deleteTnx(transactions[index].id),
                              ),
                      ],
                    ),
                  );
                },
              ),
      );
    });
  }
}
