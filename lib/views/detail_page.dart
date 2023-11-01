import 'package:flutter/material.dart';

//DetailPage
class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DetailPage für das $index. Element')),
      body: Center(child: Text('Das ist das $index. Element')),
    );
  }
}
