import 'package:flutter/material.dart';
import 'package:social_project/pages/homePage.dart';
import 'package:social_project/pages/settingsPage.dart';

import 'package:social_project/pages/termsScreen.dart';
import 'package:social_project/pages/updateProfile.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _homeScreenState();
}

int _currentIndex = 0;
final _pages = [Homepage(), Termsscreen(), UpdateProfile()];

class _homeScreenState extends State<Mainpage> {
  dynamic _page = _pages[_currentIndex];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _page = SettingsPage();
                });
              },
              icon: Icon(
                Icons.person_2_rounded,
                color: Colors.white,
              ))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: _page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _page = _pages[_currentIndex];
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_rounded),
            label: "Basket",
          ),
        ],
      ),
    );
  }
}
