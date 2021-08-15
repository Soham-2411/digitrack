import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digitrack/drawerpages/drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DigiTrack',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: NavigationBar(),
      ),
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _bottomNavIndex = 0;
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
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
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
            Text('hello');
          });
        },
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Text(
            'Welcome to DigiTrack',
            style: TextStyle(fontFamily: 'GochiHand', fontSize: 15),
          ),
        ),
      ),
    ));
  }
}
