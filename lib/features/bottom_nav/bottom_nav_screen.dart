import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_go_router_bottom_nav_example/features/profile/profile_screen.dart';
import 'package:flutter_go_router_bottom_nav_example/features/settings/settings_screen.dart';
import '../home/home_screen.dart';
import 'custom_bottom_nav.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  late Map<int, Widget> _pages;
  int _selectedIndex = 0;
  final ListQueue<int> _navigationQueue = ListQueue(0);

  @override
  void initState() {
    _pages = {
      0: const HomeScreen(),
      1: const ProfileScreen(),
      2: const SettingsScreen(),
    };
    super.initState();
  }

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _navigationQueue.removeWhere((element) => element == index);
      _navigationQueue.addLast(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) => _onItemTapped(index),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (_navigationQueue.isNotEmpty) {
            _navigationQueue.removeLast();
            int position = _navigationQueue.isEmpty ? 0 : _navigationQueue.last;
            _onItemTapped(position);
          }
          return _navigationQueue.isEmpty;
        },
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages.values.toList(),
        ),
      ),
    );
  }
}
