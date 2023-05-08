import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import 'menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 6',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App3(),
    );
  }
}

class Currency{
  String name;
  double value;

  Currency({required this.name, required this.value});

  factory Currency.fromJson(Map<String, dynamic> json){
    return Currency(
      name: json["Name"],
      value: json["Value"],
    );
  }
}

class App3 extends StatefulWidget {
  App3({Key? key}) : super(key: key);

  @override
  State<App3> createState() => _App3State();
}

class _App3State extends State<App3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Menu(),
      body: SingleChildScrollView(
        child: Column(
            children:[
              FutureBuilder<List<Currency>> (
                future: fetchCurrency(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData){
                    return Text('${snapshot.error}');
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        color: Colors.white,
                        height: 100,
                        width: 100,
                        child: ListTile(
                          title: Text(snapshot.data![index].name),
                          subtitle: Text(snapshot.data![index].value.toString()),
                        ),
                      ),
                  );
                },
              )
            ]
        ),
      ),
    );
  }

  Future<List<Currency>> fetchCurrency() async{
    final response = await http.get(Uri.parse("http://www.cbr.ru/scripts/XML_daily_eng.asp"));

    var currenciesRes = <Currency>[];

    if (response.statusCode == 200){
      final document = xml.XmlDocument.parse(response.body);
      final valCurs = document.findElements('ValCurs').first;

      final currencies = valCurs.findElements('Valute');
      for (var currency in currencies) {
        final name = currency.findElements("Name").first.text;
        final value = currency.findElements("Value").first.text;

        currenciesRes.add(Currency(name: name, value: double.parse(value.replaceAll(',', '.'))));
      }

      return currenciesRes;
    } else{
      throw Exception('Unexpected error occured!');
    }
  }


}

