import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double persentiseOfSpending;
  const ChartBar(
      {super.key,
      required this.label,
      required this.persentiseOfSpending,
      required this.spendingAmount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('${spendingAmount.toStringAsFixed(2)}')),
        SizedBox(height: 4),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: persentiseOfSpending,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
