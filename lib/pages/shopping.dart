import 'package:flutter/material.dart';

import '../constants.dart';

class Shopping extends StatefulWidget {
  @override
  _ShoppingState createState() => _ShoppingState();
}

List<String> _shoppingList = ['Eggs'];

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
                  child: ListView.builder(
                    itemCount: _shoppingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Items(_shoppingList[index]),
                          SizedBox(
                            height: 10,
                          )
                        ],
                      );
                    },
                  )),
            ),
          ),
          Container(
            width: 135,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: klightmode),
            child: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: klightmode),
                onPressed: () {
                  setState(() {
                    showAlertDialog(context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    String addedValue;

    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );

    Widget addButton = TextButton(
      child: Text("Add"),
      onPressed: () {
        setState(() {
          if (addedValue != null) {
            _shoppingList.add(addedValue);
          }
        });
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: TextField(
        onChanged: (value) {
          setState(() {
            addedValue = value;
          });
        },
      ),
      actions: [
        cancelButton,
        addButton,
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
          IconButton(
            icon: Icon(Icons.delete, size: 30),
            onPressed: () {
              setState(() {
                _shoppingList.remove(textt);
              });
            },
          ),
        ],
      ),
    );
  }
}
