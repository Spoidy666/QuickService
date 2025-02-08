import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_project/pages/loginPage.dart';
import 'package:social_project/pages/profilePage.dart';
import 'package:social_project/theme/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  Future<void> _saveThemePreference(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', value);
  }

  @override
  Widget build(BuildContext context) {
    _loadThemePreference();
    return Container(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.account_circle,
                    color: Theme.of(context).colorScheme.tertiary),
                title: Text(
                  'Profile',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profilepage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications,
                    color: Theme.of(context).colorScheme.tertiary),
                title: Text(
                  'Notifications',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationsPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.security,
                    color: Theme.of(context).colorScheme.tertiary),
                title: Text(
                  'Privacy & Security',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PrivacyPage()),
                  );
                },
              ),
              SwitchListTile(
                title: Text(
                  'Dark Mode',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                value: isDarkMode,
                activeColor: Theme.of(context).colorScheme.tertiary,
                inactiveThumbColor: Colors.grey,
                onChanged: (bool value) async {
                  await _saveThemePreference(value);

                  Provider.of<ThemeProvider>(context, listen: false)
                      .toggleTheme();
                  await _saveThemePreference(value);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.info,
                    color: Theme.of(context).colorScheme.tertiary),
                title: Text(
                  'About',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout,
                    color: Theme.of(context).colorScheme.tertiary),
                title: Text(
                  'Logout',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary),
                ),
                onTap: () {
                  _showLogoutDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.tertiary)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return Loginpage();
                }), (Route<dynamic> route) => false);
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Dummy Profile Page


// Dummy Notifications Page
class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Center(
        child: Text('Notifications Settings'),
      ),
    );
  }
}

// Dummy Privacy Page
class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy & Security'),
      ),
      body: Center(
        child: Text('Privacy Settings'),
      ),
    );
  }
}

// Dummy About Page
class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Text('QuickService App\nVersion 1.0.0'),
      ),
    );
  }
}
