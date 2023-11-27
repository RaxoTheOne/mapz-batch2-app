import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF8E4E00),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDCC1),
  onPrimaryContainer: Color(0xFF2E1500),
  secondary: Color(0xFF735943),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDCC1),
  onSecondaryContainer: Color(0xFF2A1706),
  tertiary: Color(0xFF5A6238),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFDFE8B2),
  onTertiaryContainer: Color(0xFF181E00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color.fromARGB(255, 18, 17, 18),
  onBackground: Color(0xFF201B17),
  surface: Color.fromARGB(255, 255, 255, 255),
  onSurface: Color(0xFF201B17),
  surfaceVariant: Color(0xFFF2DFD1),
  onSurfaceVariant: Color(0xFF51443A),
  outline: Color(0xFF837469),
  onInverseSurface: Color(0xFFFAEFE8),
  inverseSurface: Color(0xFF352F2B),
  inversePrimary: Color(0xFFFFB778),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF8E4E00),
  outlineVariant: Color(0xFFD6C3B6),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB778),
  onPrimary: Color(0xFF4C2700),
  primaryContainer: Color(0xFF6C3A00),
  onPrimaryContainer: Color(0xFFFFDCC1),
  secondary: Color(0xFFE2C0A5),
  onSecondary: Color(0xFF412C19),
  secondaryContainer: Color(0xFF5A422D),
  onSecondaryContainer: Color(0xFFFFDCC1),
  tertiary: Color(0xFFC3CB98),
  onTertiary: Color(0xFF2D330E),
  tertiaryContainer: Color(0xFF434A22),
  onTertiaryContainer: Color(0xFFDFE8B2),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF201B17),
  onBackground: Color(0xFFECE0DA),
  surface: Color(0xFF201B17),
  onSurface: Color(0xFFECE0DA),
  surfaceVariant: Color(0xFF51443A),
  onSurfaceVariant: Color(0xFFD6C3B6),
  outline: Color(0xFF9E8E82),
  onInverseSurface: Color(0xFF201B17),
  inverseSurface: Color(0xFFECE0DA),
  inversePrimary: Color(0xFF8E4E00),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB778),
  outlineVariant: Color(0xFF51443A),
  scrim: Color(0xFF000000),
);

// Definiere die Textstile
class AppTextStyles {
  static TextStyle headline1(Color color) {
    return TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle headline3(Color color) {
    return TextStyle(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle subtitle1(Color color) {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }
}

// Definiere das ThemeData für den hellen Modus
ThemeData lightTheme() {
  return ThemeData(
    colorScheme: lightColorScheme,
    textTheme: TextTheme(
      displayLarge: AppTextStyles.headline1(lightColorScheme.onPrimary),
      displaySmall:
          AppTextStyles.headline3(lightColorScheme.onPrimaryContainer),
      bodySmall: AppTextStyles.subtitle1(lightColorScheme.onSecondary),

      // ... (füge weitere Stile hinzu, wenn nötig)
    ),
    appBarTheme: AppBarTheme(
      color: lightColorScheme.primaryContainer,
      iconTheme: IconThemeData(color: lightColorScheme.onPrimaryContainer),
    ),
    // ... (füge weitere ThemeData-Eigenschaften für das helle Thema hinzu)
  );
}

// Definiere das ThemeData für den dunklen Modus
ThemeData darkTheme() {
  return ThemeData(
    colorScheme: darkColorScheme,
    textTheme: TextTheme(
        displayLarge: AppTextStyles.headline1(darkColorScheme.onPrimary),
        displaySmall:
            AppTextStyles.headline3(lightColorScheme.onPrimaryContainer),
        bodySmall: AppTextStyles.subtitle1(darkColorScheme.onSecondary),
        headlineMedium:
            const TextStyle(color: Color.fromARGB(255, 255, 255, 255))
        // ... (füge weitere Stile hinzu, wenn nötig)
        ),
    appBarTheme: AppBarTheme(
      color: darkColorScheme.primaryContainer,
      iconTheme: IconThemeData(color: darkColorScheme.onPrimaryContainer),
    ),

    // ... (füge weitere ThemeData-Eigenschaften für das dunkle Thema hinzu)
  );
}
