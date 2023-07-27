
import 'package:flutter/widgets.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import 'Tab/HomeTab.dart';
import 'Tab/HospitalTab.dart';
import 'Tab/MissingItemTab.dart';
import 'Tab/PoliceTab.dart';
import 'Tab/SettingTab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeTab(),
    PoliceTab(),
    HospitalTab(),
    MissingItemTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_police),
            label: 'Police',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Hospital',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Missing Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}