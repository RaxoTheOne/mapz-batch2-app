// Code für Async Api Call

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> fetchData() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));

  if (response.statusCode == 200) {
    return jsonDecode(response.body)["title"];
  } else {
    throw Exception("Daten konnten nicht übertragen werden.");
  }
}

class AsyncApi extends StatefulWidget {
  const AsyncApi({super.key});

  @override
  _AsyncApiState createState() => _AsyncApiState();
}

class _AsyncApiState extends State<AsyncApi> {
  String data = "Noch keine Daten geladen";

  void _loadData() async {
    try {
      String result = await fetchData();
      setState(() {
        data = result;
      });
    } catch (e) {
      setState(() {
        data = "Ein Fehler ist aufgetreten: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Call Beispiel"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 350,
            child: Text(
              data,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _loadData,
            child: Text("Daten laden"),
          ),
        ],
      )),
    );
  }
}
