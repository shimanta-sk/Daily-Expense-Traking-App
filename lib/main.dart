import 'package:dailytraking/chart.dart';

import './widgets/new_Transaction.dart';
import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  //VoidCallback newT;
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransaction = [];

  List<Transaction> get _recentTransactions {
    return _userTransaction.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTranx(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      date: DateTime.now(),
      amount: txAmount,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void addNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return new_Transaction(addTranx: _addNewTranx);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Count App'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () => addNewTransaction(context)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Chart(
                recentTransaction: _recentTransactions,
              ),
              Container(
                height: 300,
                child: TransactionList(transactions: _userTransaction),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 16,
          onPressed: () => addNewTransaction(context),
        ),
      ),
    );
  }
}
