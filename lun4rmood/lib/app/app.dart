import 'package:flutter/material.dart';

import '../features/check_in/check_in_page.dart';

class Lun4rMoodApp extends StatelessWidget {
  const Lun4rMoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lun△rMood',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF07101D),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF88AFFF),
          brightness: Brightness.dark,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: Color(0xFF14223A),
          contentTextStyle: TextStyle(color: Color(0xFFF5F7FB)),
        ),
      ),
      home: const CheckInPage(),
    );
  }
}
