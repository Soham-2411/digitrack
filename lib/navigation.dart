import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digitrack/drawerpages/drawer.dart';
import 'package:digitrack/pages/bmi.dart';
import 'package:digitrack/pages/shopping.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  // int _bottomNavIndex = 0;
  int _page = 0;
  Color nightMode = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'DigiTrack',
          style: TextStyle(
            fontFamily: 'GochiHand',
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.nights_stay,
              color: nightMode,
            ),
            onPressed: () {
              // do something
              //TODO: Add dark mode here
              setState(() {
                if (nightMode == Colors.white)
                  nightMode = Colors.black;
                else
                  nightMode = Colors.white;
              });
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        animationCurve: Curves.easeInOutCubic,
        color: Colors.blueGrey[800],
        animationDuration: Duration(milliseconds: 250),
        backgroundColor: Colors.white,
        height: 60,
        items: <Widget>[
          Icon(
            Icons.today,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.note,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.fitness_center,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.self_improvement,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Center(
        child: Shopping(),
        //child: BMI(),
        // child: Container(
        //   color: Colors.white,
        //   child: Text(
        //     'Welcome to DigiTrack',
        //     style: TextStyle(fontFamily: 'GochiHand', fontSize: 15),
        //   ),
        // ),
      ),
    ));
  }
}
