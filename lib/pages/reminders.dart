import 'package:digitrack/constants.dart';
import 'package:digitrack/navigation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hexcolor/hexcolor.dart';

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

List<String> remindersHeader = ['Drink Water'];
List<String> remindersTime = ['12:00'];
List<String> remindersDate = ['15 Apr'];

DateTime _dateTime = DateTime.now();

Color _tileColor = klightmode;

Future<void> destroyData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setStringList('RemindersHeader', ['']);
  prefs.setStringList('RemindersTime', ['']);
  prefs.setStringList('RemindersDate', ['']);
  reminders = [];
  remindersName = [];
}

List months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

class _RemindersState extends State<Reminders> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            color: Colors.transparent,
            padding: EdgeInsets.all(20),
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                      body: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(color: Colors.white),
                          child: Center(child: CircularProgressIndicator())));
                } else {
                  return SafeArea(
                    child: (remindersHeader == null)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "No Reminders",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.1),
                                ),
                              ),
                              SizedBox(height: 20),
                              Container(
                                width: width / 3 + 5,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: klightmode,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      padding: EdgeInsets.all(12)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AddReminder()));
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Add a reminder",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        : DisplayReminders(),
                  );
                }
              },
              future: _getData(),
            )),
      ),
    );
  }
}

class DisplayReminders extends StatefulWidget {
  @override
  _DisplayRemindersState createState() => _DisplayRemindersState();
}

class _DisplayRemindersState extends State<DisplayReminders> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Align(
            alignment: Alignment.topRight,
            child: IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: klightmode,
                  size: 25,
                ),
                onPressed: () async {
                  // setState(() {
                  //   destroyData();
                  // });
                  showAlertDialogDelete(
                      context,
                      "Are you sure you want to delete all the reminders?",
                      "Delete Reminders",
                      klightmode);
                })),
        Column(
          children: [
            SizedBox(height: 5),
            Text(
              'Reminders',
              style: TextStyle(
                fontFamily: 'GochiHand',
                fontSize: width * 0.09,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              height: 100,
              decoration: BoxDecoration(
                  color: klightmode,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    DateFormat('MMM yyyy').format(_dateTime),
                    style: TextStyle(
                        fontSize: width * 0.085,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Date",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.055,
                                fontWeight: FontWeight.w400)),
                        Text(
                          "Event",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: remindersHeader.length - 1,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: _tileColor,
                        radius: 8,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        remindersDate[index + 1],
                        style: TextStyle(
                            fontSize: width * 0.05, color: Colors.white),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: width / 2 + 50,
                        height: 90,
                        child: Card(
                          elevation: 12,
                          color: _tileColor,
                          shadowColor: _tileColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Padding(
                            padding:
                                EdgeInsets.only(left: 20, top: width * 0.04),
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: remindersHeader[index + 1] + '\n',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'GochiHand',
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * 0.06)),
                                TextSpan(
                                    text: remindersTime[index + 1] + '\n',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'GochiHand',
                                        fontWeight: FontWeight.w400,
                                        fontSize: width * 0.05))
                              ]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0, right: 10),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: klightmode,
                      elevation: 5,
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddReminder()));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

Future<String> _getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  remindersHeader = prefs.getStringList('RemindersHeader');
  remindersDate = prefs.getStringList('RemindersDate');
  remindersTime = prefs.getStringList('RemindersTime');
  if (remindersHeader == null) {
    remindersHeader = ['Drink Water'];
    remindersTime = ['12:00'];
    remindersDate = ['15 Apr'];
    prefs.setStringList('RemindersHeader', remindersHeader);
    prefs.setStringList('RemindersDate', remindersDate);
    prefs.setStringList('RemindersTime', remindersTime);
  }
  return remindersHeader[0];
}

class AddReminder extends StatefulWidget {
  DateTime _dateTime;
  TimeOfDay _timeOfDay;
  String _header;
  @override
  _AddReminderState createState() => _AddReminderState();
}

class _AddReminderState extends State<AddReminder> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: Colors.white),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a reminder',
                  style: TextStyle(
                    fontFamily: 'GochiHand',
                    fontSize: width * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: klightmode,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        labelText: "Name of reminder",
                        labelStyle: TextStyle(color: Colors.white)),
                    onChanged: (value) {
                      setState(() {
                        widget._header = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "    Date\n",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.04),
                        ),
                        Container(
                          width: width / 3,
                          decoration: BoxDecoration(
                              color: klightmode,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                            onPressed: () async {
                              var _date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100));
                              if (_date != null) {
                                setState(() {
                                  widget._dateTime = _date;
                                });
                              }
                            },
                            child: Text(
                              (widget._dateTime == null)
                                  ? "Date"
                                  : widget._dateTime.day.toString() +
                                      ' ' +
                                      months[widget._dateTime.month - 1],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "    Time\n",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.04),
                        ),
                        Container(
                          width: width / 3,
                          decoration: BoxDecoration(
                              color: klightmode,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: TextButton(
                            onPressed: () async {
                              var _time = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay(hour: 12, minute: 12));
                              if (_time != null) {
                                setState(() {
                                  widget._timeOfDay = _time;
                                });
                              }
                            },
                            child: Text(
                              (widget._timeOfDay == null)
                                  ? "Time"
                                  : (widget._timeOfDay.hour.toString() +
                                      ':' +
                                      widget._timeOfDay.minute.toString()),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(widget._dateTime);
                      print(widget._timeOfDay);
                      print(widget._header);
                      if (widget._dateTime != null &&
                          widget._timeOfDay != null &&
                          widget._header != null) {
                        setState(() {
                          remindersHeader.add(widget._header);
                          remindersDate.add(
                            widget._dateTime.day.toString() +
                                '\n' +
                                months[widget._dateTime.month - 1],
                          );
                          remindersTime.add(widget._timeOfDay.hour.toString() +
                              ':' +
                              widget._timeOfDay.minute.toString());
                        });
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setStringList('RemindersHeader', remindersHeader);
                        prefs.setStringList('RemindersDate', remindersDate);
                        prefs.setStringList('RemindersTime', remindersTime);
                        reminders.add(DateTime.utc(
                            widget._dateTime.year,
                            widget._dateTime.month,
                            widget._dateTime.day,
                            widget._timeOfDay.hour,
                            widget._timeOfDay.minute));
                        remindersName.add(widget._header);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NavigationBar(
                                      page: 3,
                                    )));
                      } else {
                        showAlertDialog(context,
                            'Please fill out all the details', 'Error');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: klightmode,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                    child: Container(
                        width: 150,
                        height: 50,
                        child: Center(
                            child: Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white, fontSize: width * 0.05),
                        ))),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String message, String title) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK",
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: klightmode,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    title: Text(title,
        style: TextStyle(
          color: Colors.white,
        )),
    content: Text(message,
        style: TextStyle(
          color: Colors.white,
        )),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

showAlertDialogDelete(
    BuildContext context, String message, String title, Color color) {
  // set up the button
  Widget yesButton = FlatButton(
    child: Text("Yes",
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      destroyData();
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: NavigationBar(
                page: 3,
              ),
              type: PageTransitionType.fade,
              duration: Duration(milliseconds: 400)));
    },
  );
  Widget noButton = FlatButton(
    child: Text("No",
        style: TextStyle(
          color: Colors.white,
        )),
    onPressed: () {
      Navigator.pop(context);
    },
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: color,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    title: Text(title,
        style: TextStyle(
          color: Colors.white,
        )),
    content: Text(message,
        style: TextStyle(
          color: Colors.white,
        )),
    actions: [noButton, yesButton],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
