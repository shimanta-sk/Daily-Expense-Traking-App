import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_list.dart';
import './new_Transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  //const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      home: Scaffold(
        appBar: AppBar(title: Text('Count App')),
        body: Column(
          children: [
            new_Transaction(),
            TransactionList(),
          ],
        ),
      ),
    );
  }
}
