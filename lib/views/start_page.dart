import 'package:flutter/material.dart';
import 'package:mapz/widgets.dart';
import 'package:mapz/constants.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(distanceM),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Home",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              "Statistics",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: distanceM),
            // Status Boxen
            Row(
              children: [
                statusBox("123", "Commits", Icons.stacked_bar_chart),
                const SizedBox(width: distanceS),
                statusBox("456", "Lines Code", Icons.code),
              ],
            ),
            const SizedBox(height: distanceM),
            const SizedBox(
              height: 150,
              child: Placeholder(),
            ),
            const SizedBox(height: distanceL),
            const Text(
              "New Activities",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const ListItemBuilder(itemCount: 20),
          ],
        ),
      ),
    );
  }
}
