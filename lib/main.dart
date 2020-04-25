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

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          MaterialButton(
            minWidth: double.infinity,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text('Currency Rates'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CurrList()),
              );
            },
          ),
          MaterialButton(
            minWidth: double.infinity,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child: Text('Currency Converter'),
            onPressed: () {},
          ),
          Container(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
