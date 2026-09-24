import 'package:flutter/material.dart';

import '../features/intro/splash_intro_view.dart';
import '../shared/theme/app_theme.dart';
import '../shared/widgets/crystaph3y_overlay.dart';
import 'app_shell.dart';

class Lun4rMoodApp extends StatelessWidget {
  const Lun4rMoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lun△rMood',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const AppRoot(),
    );
  }
}

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  bool _showIntro = true;
  bool _isModelLoaded = false;
  int _currentScreenIndex = 0;

  void _onModelLoaded() {
    setState(() => _isModelLoaded = true);
  }

  void _onEnter() {
    setState(() => _showIntro = false);
  }

  void _onTabChanged(int index) {
    setState(() => _currentScreenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_showIntro)
          SplashIntroView(isReady: _isModelLoaded, onEnter: _onEnter)
        else
          AppShell(onTabChanged: _onTabChanged),

        // CrystaPh3y existe une seule fois, tout le temps.
        // Invisible pendant l'intro, visible une fois entré dans l'app.
        Opacity(
          opacity: _showIntro ? 0.0 : 1.0,
          child: CrystaPh3yOverlay(
            onModelLoaded: _onModelLoaded,
            screenIndex: _currentScreenIndex,
          ),
        ),
      ],
    );
  }
}