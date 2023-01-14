import 'package:flutter/material.dart';

class new_Transaction extends StatelessWidget {
  new_Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Text'),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
          ),
          ElevatedButton(onPressed: () {}, child: Text('Submit your response')),
        ],
      ),
    );
  }
}
