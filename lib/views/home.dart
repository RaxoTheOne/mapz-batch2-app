import 'package:flutter/material.dart';
import 'package:batch2_app/widgets.dart';
import 'package:batch2_app/views/snippets.dart';
import 'package:shimmer/shimmer.dart';

SnippetsPage snippetsPage = SnippetsPage();
int snippetCount = snippetsPage.snippetCount;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
              ),

              // Status Boxen
              Row(
                children: [
                  statusBox(
                      context, snippetCount.toString(), "Snippets", Icons.code),
                  const SizedBox(width: 10),
                  statusBox(context, "455", "Lines Code", Icons.line_style),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  statusBox(context, "5", "Chapter", Icons.folder),
                  const SizedBox(width: 10),
                  statusBox(context, "1", "Saved Data", Icons.language),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                "New Map Activities",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 10),
              //leere box die über die ganze Breite geht
              Shimmer.fromColors(
                baseColor: Theme.of(context).colorScheme.surface,
                highlightColor: Theme.of(context).colorScheme.scrim,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(bottom: 20),
                ),
              ),

              // Text wie bei New activities nur mit "Popular Snippets"
              const SizedBox(height: 40),
              Text(
                "Popular Snippets",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              //liste mit mit platzhalter texten
              const SizedBox(height: 10),
              for (var i = 0; i < 3; i++)
                Shimmer.fromColors(
                  baseColor: Theme.of(context).colorScheme.surface,
                  highlightColor: Theme.of(context).colorScheme.scrim,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: const EdgeInsets.only(bottom: 20),
                  ),
                ),
            ],
          ),
        ));
  }
}
