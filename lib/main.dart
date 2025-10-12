import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/welcome_screen.dart';
import 'providers/survey_provider.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MorenaYogaApp());
}

class MorenaYogaApp extends StatelessWidget {
  const MorenaYogaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SurveyProvider()),
      ],
      child: MaterialApp(
        title: 'Morena Yoga',
        theme: AppTheme.lightTheme,
        home: const WelcomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
