import 'package:flutter/material.dart';
import 'package:social_project/pages/drawer.dart';
import 'package:social_project/pages/homePage.dart';
import 'package:social_project/pages/profilePage.dart';
import 'package:social_project/pages/settingsPage.dart';
import 'package:social_project/pages/signUp.dart';
import 'package:social_project/pages/termsScreen.dart';
import 'package:social_project/pages/userList.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _homeScreenState();
}

int _currentIndex = 0;
final _pages = [HomeScreen(), Userlist(), Termsscreen(), SettingsPage()];

class _homeScreenState extends State<Mainpage> {
  dynamic _page = _pages[_currentIndex];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return Signup();
            }));
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          backgroundColor: Theme.of(context).colorScheme.secondary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu,
                  color: Theme.of(context).colorScheme.tertiary),
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
                  color: Theme.of(context).colorScheme.tertiary,
                ))
          ],
        ),
        drawer: drawer(),
        body: _page,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: Theme.of(context).colorScheme.surface,
            selectedItemColor: Theme.of(context).colorScheme.tertiary,
            unselectedItemColor: Theme.of(context).colorScheme.tertiary,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
                _page = _pages[_currentIndex];
              });
            },
            items: [
              BottomNavigationBarItem(
                activeIcon: Icon(Icons.home_filled),
                icon: Icon(
                  Icons.home_outlined,
                  size: 24,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.person_2_rounded),
                  icon: Icon(
                    Icons.person_2_outlined,
                    size: 24,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.settings_backup_restore_rounded),
                  icon: Icon(
                    Icons.settings_backup_restore_outlined,
                    size: 24,
                  ),
                  label: "History"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.settings_suggest_rounded),
                  icon: Icon(
                    Icons.settings_suggest_outlined,
                    size: 24,
                  ),
                  label: "Settings"),
            ]));
  }
}
