import 'package:flutter/material.dart';
import 'package:grab_games/src/presentation/epic_game_screen/epic_game_screen.dart';
import 'package:grab_games/src/presentation/notification_screen/notification_screen.dart';
import 'package:grab_games/src/presentation/splash_screen/splash_screen.dart';
import 'package:grab_games/src/presentation/steam_screen/steam_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _navBarItems = [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_rounded),
      label: 'Epic Games',
    ),
    NavigationDestination(
      icon: Icon(Icons.bookmark_border_outlined),
      selectedIcon: Icon(Icons.bookmark_rounded),
      label: 'Steam',
    ),
    NavigationDestination(
      icon: Icon(Icons.notifications_outlined),
      selectedIcon: Icon(Icons.notifications),
      label: 'Notification',
    ),
  ];

  final _screens = [EpicGameScreen(), SteamScreen(), NotificationScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: _navBarItems,
      ),
    );
  }
}
