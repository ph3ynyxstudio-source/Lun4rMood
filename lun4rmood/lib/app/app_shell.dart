import 'dart:async';

import 'package:flutter/material.dart';

import '../data/local/in_memory_user_daily_entry_repository.dart';
import '../data/repositories/user_daily_entry_repository.dart';
import '../features/home/home_page.dart';
import '../features/journal/journal_page.dart';
import '../features/phoenix/phoenix_page.dart';
import '../features/settings/settings_page.dart';
import '../features/statistics/statistics_page.dart';
import '../shared/theme/app_colors.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final UserDailyEntryRepository _dailyEntries;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _dailyEntries = InMemoryUserDailyEntryRepository();
  }

  @override
  void dispose() {
    unawaited(_dailyEntries.close());
    super.dispose();
  }

  void _selectTab(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomePage(repository: _dailyEntries),
      JournalPage(repository: _dailyEntries),
      const StatisticsPage(),
      const PhoenixPage(),
      const SettingsPage(),
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(index: _selectedIndex, children: pages),
      bottomNavigationBar: _MainNavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: _selectTab,
      ),
    );
  }
}

class _MainNavigationBar extends StatelessWidget {
  const _MainNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Accueil',
        ),
        NavigationDestination(
          icon: Icon(Icons.edit_note_outlined),
          selectedIcon: Icon(Icons.edit_note),
          label: 'Journal',
        ),
        NavigationDestination(
          icon: Icon(Icons.insights_outlined),
          selectedIcon: Icon(Icons.insights),
          label: 'Statistiques',
        ),
        NavigationDestination(
          icon: Icon(Icons.egg_alt_outlined),
          selectedIcon: Icon(Icons.egg_alt),
          label: 'Phénix',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined),
          selectedIcon: Icon(Icons.settings),
          label: 'Paramètres',
        ),
      ],
    );
  }
}
