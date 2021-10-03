import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DigiTrack',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'GochiHand'),
      home: Scaffold(
        body: NavigationBar(
          page: 0,
        ),
        //Home page is in navigation.dart
        //Use Colors from constants.dart
        //Drawer defined in drawer.dart
      ),
    );
  }
}
