import 'package:flutter/material.dart';

//statusBoxes on Homepage to display fundamental informations
Widget statusBox(BuildContext context, String number, String explanation,
    IconData iconData) {
  ThemeData themeData = Theme.of(context);
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface, // Hintergrundfarbe aus dem Theme
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        Icon(
          iconData,
          size: 40.0,
          color: themeData
              .colorScheme.primary, // Farbe für Icons auf der primären Farbe
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
