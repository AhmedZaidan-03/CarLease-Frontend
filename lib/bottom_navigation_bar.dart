import 'package:flutter/material.dart';
import 'HomeScreen/home_screen.dart';
import 'SearchScreen/search_screen.dart';
import 'SavedScreen/saved_screen.dart';
import 'SettingsScreen/settings_screen.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentScreenIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    SearchScreen(),
    SavedScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(
      () {
        _currentScreenIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _screens.elementAt(_currentScreenIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: "Save",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
        currentIndex: _currentScreenIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey, // Färg för de inaktiva knapparna
        onTap: _onItemTapped,
      ),
    );
  }
}
