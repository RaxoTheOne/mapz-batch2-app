import 'package:flutter/material.dart';
import 'package:mapz/views/detail_page.dart';

//Listenerstellung
class ListItemBuilder extends StatelessWidget {
  final int itemCount;

  const ListItemBuilder({required this.itemCount, Key? key}) : super(key: key);

  List<Widget> _buildListItems(BuildContext context) {
    return List.generate(
        itemCount,
        (index) => ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text('$index'),
              ),
              title: Text('Headline $index'),
              subtitle: Text('Supporting Text - $index'),
              trailing: const Icon(Icons.favorite_rounded),
              contentPadding: const EdgeInsets.all(5),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(index: index),
                  ),
                );
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildListItems(context));
  }
}

// Hilfsmethode zum Erstellen einer Status-Box
Widget statusBox(String number, String explanation, IconData iconData) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 39, 39, 46),
      ),
      child: Row(children: [
        Icon(
          iconData, // Verwendung des übergebenen Icon-Datenwertes
          size: 40.0,
          color: Colors.orange,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(number,
                style:
                    const TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
            Text(explanation),
          ],
        )
      ]),
    ),
  );
}
