import 'package:flutter/material.dart';
import 'package:social_project/pages/mainPage.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
          textColor: Colors.white,
        ),
      ),
      child: Drawer(
        backgroundColor: Color(0xFF1E1E1E),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 250,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Color(0xFF2C2C2C)),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                    Expanded(
                        child: Column(
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "Email_id@gmail.com",
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Mainpage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Booking"),
              onTap: () {
                Navigator.pop(context);
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking));         //booking navigation
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Help and support"),
              onTap: () {
                Navigator.pop(context);
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>Help));         //help navigation
              },
            ),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text("Rate us"),
              onTap: () {
                Navigator.pop(context);
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>rating));         //rating navigation
              },
            ),
          ],
        ),
      ),
    );
  }
}
