import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

import 'chart.dart';
import './widgets/new_Transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
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
      return element.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  bool _showChart = false;

  void _addNewTranx(String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      date: selectedDate,
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

  void deleteItem(String id) {
    setState(() {
      _userTransaction.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text('Count App'),
      actions: [
        IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => addNewTransaction(context)),
      ],
    );
    return MaterialApp(
      title: 'Home Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'QuickSand',
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
      ),
      home: Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (isLandscape)
                Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          appBar.preferredSize.height) *
                      0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Show text'),
                      Switch(
                          value: _showChart,
                          onChanged: (val) {
                            setState(() {
                              _showChart = val;
                            });
                          })
                    ],
                  ),
                ),
              //when device is in portrait mode
              if (!isLandscape)
                Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          appBar.preferredSize.height) *
                      0.2,
                  child: Chart(
                    recentTransaction: _recentTransactions,
                  ),
                ),
              //when device is in portrait mode
              if (!isLandscape)
                Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          appBar.preferredSize.height) *
                      0.8,
                  child: TransactionList(
                      transactions: _userTransaction, deleteTnx: deleteItem),
                ),
              //when device is in landscape mode
              if (isLandscape)
                if (_showChart)
                  Container(
                    height: (MediaQuery.of(context).size.height -
                            MediaQuery.of(context).padding.top -
                            appBar.preferredSize.height) *
                        0.3,
                    child: Chart(
                      recentTransaction: _recentTransactions,
                    ),
                  ),
              //when device is in landscape mode
              if (isLandscape)
                Container(
                  height: (MediaQuery.of(context).size.height -
                          MediaQuery.of(context).padding.top -
                          appBar.preferredSize.height) *
                      0.6,
                  child: TransactionList(
                      transactions: _userTransaction, deleteTnx: deleteItem),
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
