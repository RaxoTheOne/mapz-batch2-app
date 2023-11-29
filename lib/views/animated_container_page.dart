import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  _AnimatedContainerExampleState createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _width = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sync vs Async Tester")),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedContainer(
              duration: Duration(seconds: 10),
              width: _width,
              height: 100.0,
              color: Colors.orange),
          ElevatedButton(
            child: Text('Zaubern'),
            onPressed: () {
              setState(() {
                _width = _width == 100.0 ? 200.0 : 100.0;
              });
            },
          ),
        ]),
      ),
    );
  }
}
