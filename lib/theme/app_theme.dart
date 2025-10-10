import 'package:flutter/material.dart';

class AppTheme {
  // Farben von morenayoga.de
  static const Color primaryColor = Color(0xFFFEA097); // Korallen-Rosa/Pfirsich
  static const Color secondaryColor =
      Color(0xFFE8D8BE); // Dunkleres Beige (Kontrast)
  static const Color accentColor = Color(0xFFFEA097); // Korallen-Rosa/Pfirsich
  static const Color backgroundColor = Color(0xFFF8F3EB); // Warmes helles Beige
  static const Color surfaceColor = Color(0xFFFFFFFF); // Weiß
  static const Color textPrimary = Color(0xFF0D1A10); // Dunkles Grün
  static const Color textSecondary =
      Color(0xFF5A6C5D); // Helleres Grün für Sekundärtext

  // Entspannungsarten Farben - angepasst an die Website-Ästhetik
  static const Color physicalColor = Color(0xFFD4A59A); // Warmes Terrakotta
  static const Color mentalColor = Color(0xFFA8B5C7); // Sanftes Blau-Grau
  static const Color sensoryColor = Color(0xFFB8D4D3); // Jade
  static const Color emotionalColor = Color(0xFFFEA097); // Pfirsich (Primary)
  static const Color socialColor = Color(0xFFC4D4B6); // Salbeigrün
  static const Color creativeColor = Color(0xFFE8C4A0); // Sanftes Gold
  static const Color spiritualColor = Color(0xFFD4BFCF); // Lavendel

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
        surface: surfaceColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: textPrimary),
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        ),
      ),
      cardTheme: CardThemeData(
        color: surfaceColor,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: textPrimary,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: textPrimary,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          color: textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }

  static List<Color> get relaxationColors => [
        physicalColor,
        mentalColor,
        sensoryColor,
        emotionalColor,
        socialColor,
        creativeColor,
        spiritualColor,
      ];
}
