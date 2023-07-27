
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
    return SafeArea(
      child: Scaffold(
      /*  appBar: AppBar(
          title: Text("Home Screen"),
        ),*/
        body: _screens[_currentIndex],
        bottomNavigationBar:buildBottomNavigationBar()
      ),
    );
  }
  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Customize the background color of the navigation bar
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Add a subtle shadow to the navigation bar
            blurRadius: 8,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor, // Customize the selected tab color
        unselectedItemColor: Colors.grey, // Customize the unselected tab color
        selectedFontSize: 14, // Customize the font size of the selected label
        unselectedFontSize: 12, // Customize the font size of the unselected label
        type: BottomNavigationBarType.fixed, // Ensure that all items are visible even with labels
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