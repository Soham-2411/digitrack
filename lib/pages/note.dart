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
              Text(
                  _diarydate.day.toString() +
                      '-' +
                      _diarydate.month.toString() +
                      '-' +
                      _diarydate.year.toString(),
                  style: TextStyle(fontSize: 30, fontFamily: 'GochiHand')),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
