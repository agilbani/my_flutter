import 'package:flutter/material.dart';
import 'placeholder.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import 'package:hello_rectangle/HomeScreen.dart';
import 'package:hello_rectangle/list/list.dart';
import 'package:hello_rectangle/auth/profile.dart';

class HomePage extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    // Navigator.push(context, MaterialPageRoute(builder: (context) => ExpansionTileSample())),
    // PlaceholderWidget(Colors.deepOrange),
    ListPage(),
    ExpansionTileSample(),
    ProfilePage()
  ];

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return Scaffold(
        body: Center(
          child: _children[_currentIndex],
        ),
        bottomNavigationBar: FancyBottomNavigation(
          tabs: [
              TabData(iconData: Icons.home, title: "Home"),
              TabData(iconData: Icons.list, title: "List"),
              TabData(iconData: Icons.account_circle, title: "Akun")
          ],
          onTabChangedListener: (position) {
              setState(() {
              _currentIndex = position;
              });
          },
        )
      );
    }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}