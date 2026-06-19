import 'package:flutter/material.dart';

import '../features/intro/splash_intro_view.dart';
import '../shared/theme/app_theme.dart';
import 'app_shell.dart';
import 'router.dart';

class Lun4rMoodApp extends StatelessWidget {
  const Lun4rMoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lun△rMood',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const AppShell(),
      routes: {
        AppRoutes.introSplash: (context) => const SplashIntroView(),
      },
    );
  }
}
