import 'package:flutter/material.dart';
import 'package:social_project/pages/drawer.dart';
import 'package:social_project/pages/homePage.dart';
import 'package:social_project/pages/individualUser.dart';
import 'package:social_project/pages/settingsPage.dart';
import 'package:social_project/pages/signUp.dart';
import 'package:social_project/pages/userList.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _homeScreenState();
}

int _currentIndex = 0;
final _pages = [HomeScreen(), Userlist(), Signup(), SettingsPage()];

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
        drawer: drawer(),
        body: _page,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[400],
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
                _page = _pages[_currentIndex];
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: 24,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 24,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    size: 24,
                  ),
                  label: "History"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 24,
                  ),
                  label: "Settings"),
            ]));
  }
}
