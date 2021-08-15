import 'package:digitrack/drawerpages/about.dart';
import 'package:digitrack/drawerpages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 250,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade800,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontFamily: 'GochiHand',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 57,
                      backgroundColor: Colors.blueGrey[800],
                      child: Container(
                        height: 105,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/Icon.png'),
                          radius: 50,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Profile',
              style: TextStyle(
                fontFamily: 'GochiHand',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'About',
              style: TextStyle(
                fontFamily: 'GochiHand',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
          ListTile(
            title: const Text(
              'Dark Mode',
              style: TextStyle(
                fontFamily: 'GochiHand',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              setState(() {});
            },
          ),
          ListTile(
            title: const Text(
              'Exit',
              style: TextStyle(
                fontFamily: 'GochiHand',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            onTap: () {
              setState(() {
                SystemNavigator.pop();
              });
            },
          ),
        ],
      ),
    );
  }
}
