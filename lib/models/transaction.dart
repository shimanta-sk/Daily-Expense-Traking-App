import 'package:flutter/material.dart';

class Transaction extends StatelessWidget {
  String? id;
  String? title;
  double? amount;
  DateTime? date;
  Transaction({
    super.key,
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
