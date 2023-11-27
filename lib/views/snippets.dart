import 'package:flutter/material.dart';
import 'package:mapz/widgets.dart';
import 'package:mapz/constants.dart';
import 'package:mapz/views/snippets/sync_vs_async.dart';

class SnippetPage extends StatelessWidget {
  const SnippetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(distanceM),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Snippets",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "Collection",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                        height: 50,
                        child: Image(image: AssetImage("assets/logo.png"))),
                  ],
                )
              ],
            ),

            const SizedBox(height: distanceM),
            // Status Boxen
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SyncAsyncDemo(),
                      ),
                    );
                  },
                  child: Text("Async vs Sync Tester"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
