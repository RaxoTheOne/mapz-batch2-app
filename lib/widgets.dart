import 'package:flutter/material.dart';
import 'package:mapz/views/detail_page.dart';

//Listenerstellung
class ListItemBuilder extends StatelessWidget {
  final int itemCount;
  const ListItemBuilder({required this.itemCount, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme =
        Theme.of(context); // Hole das aktuelle ThemeData-Objekt

    return Column(children: _buildListItems(context, theme));
  }

  List<Widget> _buildListItems(BuildContext context, ThemeData theme) {
    return List.generate(
      itemCount,
      (index) => ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme
              .primaryContainer, // Setze die primäre Farbe des aktuellen Themes
          child: Text('$index',
              style: TextStyle(
                color: theme.colorScheme.onPrimaryContainer,
              )),
        ),
        title: Text('Headline $index',
            style: TextStyle(
              color: theme.colorScheme.onSurface,
            )),
        subtitle: Text('Supporting Text - $index',
            style: TextStyle(
              color: theme.colorScheme.onSecondaryContainer,
            )),
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
      ),
    );
  }
}

// hier aufruf von Theme aber kein TextStyle
// Freie Funktion zum Erstellen einer Status-Box
Widget statusBox(BuildContext context, String number, String explanation,
    IconData iconData) {
  ThemeData themeData = Theme.of(context);
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: themeData
            .colorScheme.primaryContainer, // Hintergrundfarbe aus dem Theme
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(children: [
        Icon(
          iconData,
          size: 40.0,
          color: themeData.colorScheme
              .onPrimaryContainer, // Farbe für Icons auf der primären Farbe
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                color: themeData.colorScheme
                    .onPrimaryContainer, // Textfarbe für Text auf der primären Farbe
              ),
            ),
            Text(
              explanation,
              style: TextStyle(
                color: themeData.colorScheme
                    .onPrimaryContainer, // Textfarbe für Text auf der primären Farbe
              ),
            ),
          ],
        )
      ]),
    ),
  );
}
