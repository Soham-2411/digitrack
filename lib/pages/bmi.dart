import 'package:digitrack/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

class BMI extends StatefulWidget {
  //const BMI({ Key? key }) : super(key: key);

  @override
  _BMIState createState() => _BMIState();
}

double _height = 120;
String height = _height.toStringAsFixed(0);
double _weight = 60;
String weight = _weight.toStringAsFixed(0);
double _age = 20;
String age = _age.toStringAsFixed(0);
Color color1 = Colors.blueGrey[400];
Color color2 = Colors.blueGrey[800];
Color mColor = color1;
Color fColor = color1;
int h = 0;
int w = 0;
double _bmi = (w / pow(h, 2)) * 10000;
String bmi = _bmi.toStringAsFixed(0);
Color bmiColor = Colors.white;

class _BMIState extends State<BMI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 450,
              height: 40,
              decoration: BoxDecoration(
                  color: klightmode, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text('BMI CALCULATOR',
                    style: TextStyle(
                        fontFamily: 'GochiHand',
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: mColor,
                  ),
                  width: 165,
                  height: 170,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (mColor == color1) {
                          mColor = color2;
                          fColor = color1;
                        }
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.mars,
                          color: klightmodebackground,
                          size: 80,
                        ),
                        SizedBox(height: 5),
                        Text('MALE',
                            style: TextStyle(
                              fontSize: 25,
                              color: klightmodebackground,
                              fontFamily: 'GochiHand',
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: fColor,
                  ),
                  width: 165,
                  height: 170,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (fColor == color1) {
                          fColor = color2;
                          mColor = color1;
                        }
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.venus,
                          color: klightmodebackground,
                          size: 80,
                        ),
                        SizedBox(height: 5),
                        Text('FEMALE',
                            style: TextStyle(
                              fontSize: 25,
                              color: klightmodebackground,
                              fontFamily: 'GochiHand',
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: klightmode,
              ),
              width: 450,
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT',
                      style: TextStyle(
                        fontSize: 25,
                        color: klightmodebackground,
                        fontFamily: 'GochiHand',
                        fontWeight: FontWeight.bold,
                      )),
                  Text('$height cm',
                      style: TextStyle(
                        fontSize: 25,
                        color: klightmodebackground,
                        fontFamily: 'GochiHand',
                        fontWeight: FontWeight.bold,
                      )),
                  Slider(
                    activeColor: klightmodebackground,
                    min: 120,
                    max: 220,
                    value: _height,
                    onChanged: (value) {
                      setState(() {
                        _height = value;
                        height = _height.toStringAsFixed(0);
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: klightmode,
                    ),
                    width: 165,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('WEIGHT',
                            style: TextStyle(
                              fontSize: 25,
                              color: klightmodebackground,
                              fontFamily: 'GochiHand',
                              fontWeight: FontWeight.bold,
                            )),
                        Text('$weight kg',
                            style: TextStyle(
                              fontSize: 25,
                              color: klightmodebackground,
                              fontFamily: 'GochiHand',
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              constraints: BoxConstraints.tightFor(
                                  height: 56.0, width: 56.0),
                              shape: CircleBorder(),
                              fillColor: klightmodebackground,
                              onPressed: () {
                                setState(() {
                                  _weight++;
                                  weight = _weight.toStringAsFixed(0);
                                });
                              },
                              elevation: 0,
                              child: Icon(Icons.add),
                            ),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              constraints: BoxConstraints.tightFor(
                                  height: 56.0, width: 56.0),
                              shape: CircleBorder(),
                              fillColor: klightmodebackground,
                              onPressed: () {
                                setState(() {
                                  _weight--;
                                  weight = _weight.toStringAsFixed(0);
                                });
                              },
                              elevation: 0,
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: klightmode,
                    ),
                    width: 165,
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE',
                            style: TextStyle(
                              fontSize: 25,
                              color: klightmodebackground,
                              fontFamily: 'GochiHand',
                              fontWeight: FontWeight.bold,
                            )),
                        Text('$age',
                            style: TextStyle(
                              fontSize: 25,
                              color: klightmodebackground,
                              fontFamily: 'GochiHand',
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              constraints: BoxConstraints.tightFor(
                                  height: 56.0, width: 56.0),
                              shape: CircleBorder(),
                              fillColor: klightmodebackground,
                              onPressed: () {
                                setState(() {
                                  _age++;
                                  age = _age.toStringAsFixed(0);
                                });
                              },
                              elevation: 0,
                              child: Icon(Icons.add),
                            ),
                            SizedBox(width: 10),
                            RawMaterialButton(
                              constraints: BoxConstraints.tightFor(
                                  height: 56.0, width: 56.0),
                              shape: CircleBorder(),
                              fillColor: klightmodebackground,
                              onPressed: () {
                                setState(() {
                                  _age--;
                                  age = _age.toStringAsFixed(0);
                                });
                              },
                              elevation: 0,
                              child: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.pink,
              ),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    h = int.parse(height);
                    w = int.parse(weight);
                    _bmi = (w / pow(h, 2)) * 10000;
                    if (_bmi < 18.5) {
                      bmiColor = Colors.blue;
                    } else if (_bmi >= 18.5) {
                      if (_bmi >= 25) {
                        bmiColor = Colors.red;
                      } else {
                        bmiColor = Colors.green;
                      }
                    }
                    bmi = _bmi.toStringAsFixed(1);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultPage()),
                    );
                  });
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: klightmodebackground,
                      fontFamily: 'GochiHand',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(
              fontFamily: 'GochiHand',
              fontSize: 32,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: klightmode,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: klightmode,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your bmi is $bmi',
                    style: TextStyle(
                        color: bmiColor,
                        fontFamily: 'GochiHand',
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  Text(
                    'height: $height \n weight: $weight \n age: $age',
                    style: TextStyle(
                        color: klightmodebackground,
                        fontFamily: 'GochiHand',
                        fontSize: 25),
                  )
                ],
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: klightmode,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Formula: weight (kg) / [height (m)]2',
                    style: TextStyle(
                        color: klightmodebackground,
                        fontFamily: 'GochiHand',
                        fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 10),
                    child: Table(
                      border: TableBorder.all(width: 1.0, color: Colors.white),
                      children: [
                        TableRow(children: [
                          Center(
                            child: Text(
                              'BMI',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'GochiHand',
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.5,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Weight Status',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'GochiHand',
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.4,
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Text(
                            "Below 18.5",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GochiHand',
                            ),
                          )),
                          Center(
                              child: Text(
                            "Underweight",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'GochiHand',
                            ),
                          )),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Text(
                            "18.5 – 24.9",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GochiHand',
                            ),
                          )),
                          Center(
                              child: Text(
                            "Healthy Weight",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.green,
                              fontFamily: 'GochiHand',
                            ),
                          )),
                        ]),
                        TableRow(children: [
                          Center(
                              child: Text(
                            "25.0 – 29.9",
                            textScaleFactor: 1.2,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'GochiHand',
                            ),
                          )),
                          Center(
                              child: Text(
                            "Overweight",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'GochiHand',
                            ),
                          )),
                        ]),
                      ],
                    ),
                  )
                ],
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 30,
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    _launchURL();
                  },
                  child: Text(
                    'Press to know more about BMI',
                    style: TextStyle(
                        color: klightmodefont,
                        fontFamily: 'GochiHand',
                        fontSize: 15),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: double.infinity,
              child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Recalculate',
                    style: TextStyle(
                        color: klightmodebackground,
                        fontFamily: 'GochiHand',
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

void _launchURL() async {
  const url =
      'https://www.cdc.gov/healthyweight/assessing/bmi/adult_bmi/index.html';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
