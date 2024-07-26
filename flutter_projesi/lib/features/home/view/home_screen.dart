import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty3/features/characters/view/character_screen.dart';
import 'package:rick_and_morty3/features/locations/view/location_screen.dart';
import 'package:rick_and_morty3/features/characters/view/followed_characters_screen.dart';

import '../../characters/view/character_screen.dart';
import '../../characters/view/followed_characters_screen.dart';
import '../../locations/view/location_screen.dart'; // FollowedCharactersScreen'i ekliyoruz

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home/characters');
        break;
      case 1:
        context.go('/home/locations');
        break;
      case 2:
        context.go('/home/followed');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        backgroundColor: Colors.green,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          CharacterScreen(),
          LocationScreen(),
          FollowedCharactersScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Karakterler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Lokasyonlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Takip edilenler',
          ),
        ],
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.7),
      ),
    );
  }
}
