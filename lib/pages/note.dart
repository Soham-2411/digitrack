import 'package:digitrack/constants.dart';
import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

DateTime _diarydate = DateTime.now();

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(20),
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
                      });
                    }
                  },
                  child: Text(
                      _diarydate.day.toString() +
                          '-' +
                          _diarydate.month.toString() +
                          '-' +
                          _diarydate.year.toString(),
                      style: TextStyle(
                          color: klightmode,
                          fontSize: 30,
                          fontFamily: 'GochiHand'))),
              IconButton(
                icon: Icon(Icons.arrow_right_outlined),
                onPressed: () {
                  setState(() {
                    _diarydate = _diarydate.add(new Duration(days: 1));
                  });
                },
              ),
            ],
          ),
          Container(
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
                    onPressed: () {},
                    child: Container(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.edit, color: klightmode)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "SUMMER HOLIDAYS\n\n",
                            style: TextStyle(
                                fontSize: w * 0.07,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "Today, my summer holidays have begun. I have some plans for summer vacation. I’m planning to go to a wildlife sanctuary and for boating in a lake. I just don’t want to spend a single moment idly and definitely want to enjoy every bit of these holidays.",
                            style: TextStyle(
                                color: Colors.white, fontSize: w * 0.04))
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
