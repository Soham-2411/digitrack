import 'package:flutter/material.dart';
import 'navigation.dart';

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
        //Home page is in navigation.dart
        //Use Colors from constants.dart
        //Drawer defined in drawer.dart
      ),
    );
  }
}
