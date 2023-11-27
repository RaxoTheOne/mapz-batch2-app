import 'package:flutter/material.dart';
import 'dart:async';

class SyncAsyncDemo extends StatefulWidget {
  const SyncAsyncDemo({super.key});

  @override
  _SyncAsyncDemoState createState() => _SyncAsyncDemoState();
}

class _SyncAsyncDemoState extends State<SyncAsyncDemo> {
  String _data = "";

  void _runSync() {
    print("Synchrone Funktion statet");
    int start = DateTime.now().millisecondsSinceEpoch;
    while (DateTime.now().millisecondsSinceEpoch - start < 5000) {}
    _data = "Synchrone Daten geladen";
    print("Synchrone Funktion beenedet");
    setState(() {});
  }

  Future<void> _runAsync() async {
    print("Asynchrone Funktion startet");
    await Future.delayed(const Duration(seconds: 5));
    _data = "Asychrone Daten geladen";
    print("Asynchrone Funktion beenedet");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sync vs Async Tester")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: _runSync,
                child: const Text("Starte Synchrone Funktion")),
            ElevatedButton(
                onPressed: _runAsync,
                child: const Text("Starte Asynchrone Funktion")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(_data),
            ),
          ],
        ),
      ),
    );
  }
}
