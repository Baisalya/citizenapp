import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

class HomeTab extends StatelessWidget {
  final PageController _pageController = PageController();
  Timer? _scrollTimer;

  @override
  Widget build(BuildContext context) {
    _autoScroll();

    return Scaffold(
      /* appBar: AppBar(
        title: Text('Home Screen'),
      ),*/
      body: SafeArea(
        child: ListView(
          children: [
            _buildTopContainer(),
            _buildCardView(),
            Divider(thickness: 1, color: Colors.grey),
            _buildEmergencyContacts(),
            _buildMessageSentUI(),
          ],
        ),
      ),
    );
  }

  void _autoScroll() {
    _scrollTimer?.cancel();
    _scrollTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (_pageController.page == 3) {
        _pageController.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
      } else {
        _pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
      }
    });
  }

  Widget _buildTopContainer() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final avatarSize = screenWidth * 0.2;
        final avatarRadius = avatarSize * 0.5;
        final spacing = screenWidth * 0.04;
        final buttonTextSize = screenWidth * 0.04;

        return Container(
          padding: EdgeInsets.all(spacing),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.center,
              radius: 1.5,
              colors: [Colors.redAccent, Colors.deepOrange],
            ),
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: avatarRadius,
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: avatarSize * 0.6, color: Colors.grey),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Baisalya Roul',
                      style: TextStyle(
                        fontSize: buttonTextSize * 1.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: spacing),
                    Text(
                      'Aul,Kendrapara',
                      style: TextStyle(
                        fontSize: buttonTextSize,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle Edit Profile button tap
                  Get.toNamed('/editProfile');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: spacing * 2, vertical: spacing),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: buttonTextSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildCardView() {
    return Container(
      height: 200.0,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        onPageChanged: (index) {
          // Do something when the page changes (optional)
        },
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Card ${index + 1}',
                    style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Some additional information',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmergencyContacts() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Emergency Contacts',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.contact_emergency),
                onPressed: () {
                  // Add your logic to handle the "Add Contact" button click
                },
                color: Colors.black87, // Icon color
                iconSize: 30.0, // Icon size
                padding: EdgeInsets.all(10.0), // Padding around the icon
                splashRadius: 20.0, // Splash radius when tapped
                tooltip: 'Add Contact', // Tooltip
                splashColor: Colors.green, // Splash color when tapped
              ),
            ],
          ),
          SizedBox(height: 10.0),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Contact 1'),
            subtitle: Text('8249166181'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Contact 2'),
            subtitle: Text('8249166181'),
          ),
        ],
      ),
    );
  }


  Widget _buildMessageSentUI() {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Message Sent',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Sent on 2023-07-27'),
            subtitle: Text('Your message has been delivered successfully.'),
          ),
        ],
      ),
    );
  }
}
