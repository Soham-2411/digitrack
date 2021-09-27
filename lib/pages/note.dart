import 'package:digitrack/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

DateTime _diarydate = DateTime.now();

String displayDate = _diarydate.day.toString() +
    '-' +
    _diarydate.month.toString() +
    '-' +
    _diarydate.year.toString();

bool editText = false;

String heading;
String content;

Future<String> _getdata() async {
  final prefs = await SharedPreferences.getInstance();
  heading = prefs.getString(displayDate + "Heading") ?? '';
  content = prefs.getString(displayDate + "Content") ?? '';
  return heading ?? "Done";
}

Future<void> _setData(String head, String cont) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(displayDate + "Heading", head);
  await prefs.setString(displayDate + "Content", cont);
  print(displayDate + cont);
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left_outlined),
                  onPressed: () {
                    setState(() {
                      _diarydate = _diarydate.subtract(new Duration(days: 1));
                      displayDate = _diarydate.day.toString() +
                          '-' +
                          _diarydate.month.toString() +
                          '-' +
                          _diarydate.year.toString();
                    });
                  },
                ),
                TextButton(
                    onPressed: () async {
                      DateTime _dateTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (_dateTime != null) {
                        setState(() {
                          _diarydate = _dateTime;
                          displayDate = _diarydate.day.toString() +
                              '-' +
                              _diarydate.month.toString() +
                              '-' +
                              _diarydate.year.toString();
                        });
                      }
                    },
                    child: Text(displayDate,
                        style: TextStyle(
                            color: klightmode,
                            fontSize: 30,
                            fontFamily: 'GochiHand'))),
                IconButton(
                  icon: Icon(Icons.arrow_right_outlined),
                  onPressed: () {
                    setState(() {
                      _diarydate = _diarydate.add(new Duration(days: 1));
                      displayDate = _diarydate.day.toString() +
                          '-' +
                          _diarydate.month.toString() +
                          '-' +
                          _diarydate.year.toString();
                    });
                  },
                ),
              ],
            ),
            FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    height: h * 0.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: klightmode),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return (editText ? editTextFields(h, w) : showContent(h, w));
                }
              },
              future: _getdata(),
            )
          ],
        ),
      ),
    );
  }

  Widget showContent(double h, double w) {
    return Container(
      height: h * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: klightmode),
      padding: EdgeInsets.only(bottom: 20, right: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, shape: CircleBorder()),
              onPressed: () {
                setState(() {
                  if (editText) {
                    editText = false;
                  } else {
                    editText = true;
                  }
                });
              },
              child: Container(
                  padding: EdgeInsets.all(15),
                  child: Icon((editText ? Icons.close : Icons.edit),
                      color: klightmode)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(20),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: (heading ?? "No data for $displayDate") + "\n\n",
                      style: TextStyle(
                          fontSize: w * 0.07,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  TextSpan(
                      text: content ?? "",
                      style: TextStyle(color: Colors.white, fontSize: w * 0.04))
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget editTextFields(double h, double w) {
    String tempHeading = heading;
    String tempContent = content;
    return Container(
      height: h * 0.65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: klightmode),
      padding: EdgeInsets.only(bottom: 20, right: 10),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, shape: CircleBorder()),
                  onPressed: () async {
                    setState(() {
                      heading = tempHeading;
                      content = tempContent;
                      editText = false;
                    });
                    await _setData(tempHeading, tempContent);
                    await _getdata();
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.check, color: klightmode)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, shape: CircleBorder()),
                  onPressed: () {
                    setState(() {
                      if (editText) {
                        editText = false;
                      } else {
                        editText = true;
                      }
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.all(15),
                      child: Icon((editText ? Icons.close : Icons.edit),
                          color: klightmode)),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                        onChanged: (value) {
                          tempHeading = value;
                        },
                        decoration: InputDecoration(
                            hintText: 'Enter a heading',
                            hintStyle: TextStyle(
                                fontSize: w * 0.08,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        initialValue: heading ?? "",
                        style: TextStyle(
                            fontSize: w * 0.08,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    TextFormField(
                      onChanged: (value) {
                        tempContent = value;
                        print(tempContent);
                      },
                      maxLines: null,
                      minLines: 1,
                      decoration: InputDecoration(
                          hintText: 'Enter Content',
                          hintStyle: TextStyle(
                              color: Colors.white, fontSize: w * 0.05)),
                      initialValue: content ?? "",
                      style: TextStyle(color: Colors.white, fontSize: w * 0.05),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
