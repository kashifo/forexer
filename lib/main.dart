import 'package:flutter/material.dart';
import 'currency_list.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Forexer'),
        ),
        body: CurrList(),
      ),
    ),
  );
}
