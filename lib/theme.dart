import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFFF9500),
  onPrimary: Color(0xFF000000),
  primaryContainer: Color(0xFFFFFFFF),
  onPrimaryContainer: Color(0xFF2E1500),
  secondary: Color(0xFFFF9500),
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
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF201B17),
  surface: Color.fromARGB(255, 244, 244, 244),
  onSurface: Color(0xFF201B17),
  surfaceVariant: Color.fromARGB(255, 230, 230, 230),
  onSurfaceVariant: Color(0xFF51443A),
  outline: Color(0xFF837469),
  onInverseSurface: Color(0xFFFAEFE8),
  inverseSurface: Color(0xFF352F2B),
  inversePrimary: Color(0xFFFFB778),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFF9500),
  outlineVariant: Color(0xFFD6C3B6),
  scrim: Color.fromARGB(255, 231, 231, 231),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFF9500),
  onPrimary: Color(0xFF4C2700),
  primaryContainer: Color(0xFF000000),
  onPrimaryContainer: Color(0xFFFFFFFF),
  secondary: Color(0xFFFF9500),
  onSecondary: Color(0xFF412C19),
  secondaryContainer: Color(0xFF5A422D),
  onSecondaryContainer: Color(0xFFFFFFFF),
  tertiary: Color(0xFFC3CB98),
  onTertiary: Color(0xFF2D330E),
  tertiaryContainer: Color(0xFF434A22),
  onTertiaryContainer: Color(0xFFDFE8B2),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF000000),
  onBackground: Color(0xFFECE0DA),
  surface: Color(0xFF111111),
  onSurface: Color(0xFFECE0DA),
  surfaceVariant: Color(0xFF51443A),
  onSurfaceVariant: Color(0xFFFFFFFF),
  outline: Color(0xFF9E8E82),
  onInverseSurface: Color(0xFF201B17),
  inverseSurface: Color(0xFFECE0DA),
  inversePrimary: Color(0xFF8E4E00),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB778),
  outlineVariant: Color(0xFF51443A),
  scrim: Color(0xFF262626),
);

//updated ColorScheme for darkmode
const darkColorScheme2 = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFF9500),
  onPrimary: Color(0xFF4C2700),
  primaryContainer: Color(0xFF1E1E1E),
  onPrimaryContainer: Color(0xFFFFFFFF),
  secondary: Color(0xFFFF9500),
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
  background: Color(0xFF1E1E1E),
  onBackground: Color(0xFFECE0DA),
  surface: Color(0xFF262626),
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
  scrim: Color(0xFF262626),
);

ThemeData lightTheme() {
  return ThemeData(
    colorScheme: lightColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: lightColorScheme.background,
    appBarTheme: AppBarTheme(
      //no shadow
      elevation: 0,
      //text left
      centerTitle: false,
      //bigger font in appbar
      titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: lightColorScheme.onPrimaryContainer),
      color: lightColorScheme.primaryContainer,
      iconTheme: IconThemeData(color: lightColorScheme.onPrimaryContainer),
    ),
  );
}

ThemeData darkTheme() {
  return ThemeData(
    colorScheme: darkColorScheme,
    useMaterial3: true,
    scaffoldBackgroundColor: darkColorScheme.background,
    appBarTheme: AppBarTheme(
      //no shadow
      elevation: 0,
      //text left
      centerTitle: false,
      //bigger font in appbar
      titleTextStyle: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: darkColorScheme.onPrimaryContainer),
      color: darkColorScheme.primaryContainer,
      iconTheme: IconThemeData(color: darkColorScheme.onPrimaryContainer),
    ),
  );
}
