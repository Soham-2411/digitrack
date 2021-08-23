import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:digitrack/constants.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[800],
        title: Text(
          'About',
          style: TextStyle(
            fontFamily: 'GochiHand',
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: klightmodebackground,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 67,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey[500],
                        radius: 64,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/shresth1.jpg'),
                          radius: 63,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchURL();
                          },
                          child: Image(
                            height: 25,
                            image: AssetImage('assets/github.png'),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            _launchURL1();
                          },
                          child: Image(
                            height: 22,
                            image: AssetImage('assets/in.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Shresth Kapoor',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'GochiHand',
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 67,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey[500],
                        radius: 64,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/soham.jpg'),
                          radius: 63,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _launchURL2();
                          },
                          child: Image(
                            height: 25,
                            image: AssetImage('assets/github.png'),
                          ),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            _launchURL3();
                          },
                          child: Image(
                            height: 22,
                            image: AssetImage('assets/in.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Soham Sakaria',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'GochiHand',
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text(
              'An application to digitize your daily routines, included features are\n\n 1. Reminders\n 2. Shopping List\n 3. Diary\n 4. BMI and Health\n 5. WellBeing',
              style: TextStyle(
                  fontSize: 25, color: Colors.black, fontFamily: 'GochiHand'),
            ),
          )
        ],
      ),
    );
  }
}

void _launchURL() async {
  const url = 'https://github.com/shresthkapoor7';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURL1() async {
  const url = 'https://www.linkedin.com/in/shresth-kapoor-7skp/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURL2() async {
  const url = 'https://github.com/Soham-2411';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

void _launchURL3() async {
  const url = 'https://www.linkedin.com/in/soham-sakaria-13251718b/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
