import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forexer/Currency.dart';
import 'package:http/http.dart' as http;

class CurrList extends StatelessWidget {
  final String urlForex = "https://api.exchangeratesapi.io/latest?base=USD";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<List<Currency>>(
        future: fetchCurrencies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        snapshot.data[index].name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(snapshot.data[index].value),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<List<Currency>> fetchCurrencies() async {
    final response = await http.get(urlForex);

    if (response.statusCode == 200) {
      //String stringJson = response.body;
      //print('stringJson=' + stringJson);

      final decoded = jsonDecode(response.body) as Map;
      final data = decoded['rates'] as Map;
      List<Currency> currList = new List();

      for (final name in data.keys) {
        final value = data[name];
        //print('$name=$value');

        Currency cur = new Currency(name.toString(), value.toString());

        if (name.toString() == 'INR')
          currList[0] = cur;
        else
          currList.add(cur);
      }

      print(currList.length.toString());
      return currList;
    } else {
      throw Exception('Failed to fetch data.');
    }
  }
}
