import 'package:flutter/material.dart';

import '../constants.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Text('SHOPPING LIST',
                    style: TextStyle(
                        fontFamily: 'GochiHand',
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                  color: klightmode, borderRadius: BorderRadius.circular(5)),
              width: 450,
              height: 485,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Items('Buy Bread'),
                    SizedBox(height: 10),
                    Items('Buy Milk'),
                    SizedBox(height: 10),
                    Items('Buy Eggs'),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 135,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: klightmode),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'Add Items',
                          style: TextStyle(
                              fontFamily: 'GochiHand',
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(width: 2),
                        Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Container Items(String textt) {
  String text = textt;
  return Container(
    color: Colors.white,
    width: 300,
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          text,
          style: TextStyle(fontSize: 30, fontFamily: 'GochiHand'),
        ),
        SizedBox(width: 100),
        Icon(Icons.edit),
        Icon(Icons.delete, size: 30),
      ],
    ),
  );
}
