import 'package:flutter/material.dart';
import 'currency_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Forexer'),
          centerTitle: true,
        ),
        body: CurrList(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.compare_arrows),
          onPressed: () {
            Fluttertoast.showToast(msg: 'Conversion feature coming soon.');
          },
        ),
      ),
    ),
  );
}
