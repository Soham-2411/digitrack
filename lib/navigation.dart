import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digitrack/drawerpages/drawer.dart';
import 'package:digitrack/pages/bmi.dart';
import 'package:digitrack/pages/note.dart';
import 'package:digitrack/pages/reminders.dart';
import 'package:digitrack/pages/shopping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NavigationBar extends StatefulWidget {
  final int page;
  const NavigationBar({Key key, this.page = 0}) : super(key: key);
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

List<DateTime> reminders = [];
List<String> remindersName = [];

class _NavigationBarState extends State<NavigationBar> {
  // int _bottomNavIndex = 0;
  Color nightMode = Colors.white;
  FlutterLocalNotificationsPlugin localNotification;
  DateTime _dateTime = DateTime.now();
  Timer _timer;
  int _page;
  @override
  void initState() {
    _page = widget.page;
    super.initState();
    var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    var iosInitialize = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        android: androidInitialize, iOS: iosInitialize);
    localNotification = new FlutterLocalNotificationsPlugin();
    localNotification.initialize(initializationSettings);
    print("Timer");
    print(_dateTime);
    print(reminders);
    print(remindersName);
    _reminderTimer();
  }

  void _reminderTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      print("Timer running");
      setState(() {
        _dateTime = DateTime.now();
      });
      for (int c = 0; c < reminders.length; c++) {
        if (_dateTime.day == reminders[c].day &&
            _dateTime.month == reminders[c].month &&
            _dateTime.hour == reminders[c].hour &&
            _dateTime.minute == reminders[c].minute) {
          _showNotifications(remindersName[c]);
        }
      }
    });
  }

  Future _showNotifications(String heading) async {
    var androidDetails =
        new AndroidNotificationDetails("channelId", "Digitrack", heading);
    var iosDetails = new IOSNotificationDetails();
    var generalNotifcationDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    await localNotification.show(
        0, "Digitrack Reminder", heading, generalNotifcationDetails);
  }

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
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      drawer: AppDrawer(),
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
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
            Icons.book,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.timer,
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
          child: (_page == 0)
              ? BMI()
              : (_page == 1)
                  ? Shopping()
                  : (_page == 2)
                      ? Notes()
                      : Reminders()),
    ));
  }
}
