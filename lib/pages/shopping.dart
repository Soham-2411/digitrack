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
    double pw = MediaQuery.of(context).size.width;
    double ph = MediaQuery.of(context).size.height;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: 10.0, right: 10, bottom: 10, top: 10),
              child: Container(
                width: pw,
                height: ph * 0.045,
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
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: klightmode, borderRadius: BorderRadius.circular(5)),
                width: pw,
                height: ph * 0.635,
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListView.builder(
                      itemCount: _shoppingList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Items(_shoppingList[index], index),
                            SizedBox(
                              height: ph * 0.01,
                            )
                          ],
                        );
                      },
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
              child: Container(
                width: pw * 0.5,
                height: ph * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), color: klightmode),
                child: Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: klightmode),
                    onPressed: () {
                      setState(() {
                        showAddDialog(context);
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
            ),
          ],
        ),
      ),
    );
  }

  showAddDialog(BuildContext context) {
    String addedValue;

    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: klightmode,
          fontSize: 20,
          fontFamily: 'GochiHand',
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget addButton = TextButton(
      child: Text("Add",
          style: TextStyle(
            color: klightmode,
            fontSize: 20,
            fontFamily: 'GochiHand',
          )),
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
      title: Text("Add an item",
          style: TextStyle(
            color: klightmode,
            fontSize: 20,
            fontFamily: 'GochiHand',
          )),
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

  showEditDialog(BuildContext context, String item, int index) {
    String addedValue;
    Widget cancelButton = TextButton(
      child: Text(
        "Cancel",
        style: TextStyle(
          color: klightmode,
          fontSize: 20,
          fontFamily: 'GochiHand',
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    Widget addButton = TextButton(
      child: Text("Change",
          style: TextStyle(
            color: klightmode,
            fontSize: 20,
            fontFamily: 'GochiHand',
          )),
      onPressed: () {
        setState(() {
          if (addedValue != null) {
            _shoppingList[index] = addedValue;
          }
        });
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Add an item",
          style: TextStyle(
            color: klightmode,
            fontSize: 20,
            fontFamily: 'GochiHand',
          )),
      content: TextFormField(
        initialValue: item,
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

  Container Items(String textt, int index) {
    double pw = MediaQuery.of(context).size.width;
    double ph = MediaQuery.of(context).size.height;
    String text = textt;
    return Container(
      color: Colors.white,
      width: pw,
      height: ph * 0.07,
      padding: EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 30, fontFamily: 'GochiHand'),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit, size: 30),
                onPressed: () {
                  setState(() {
                    showEditDialog(context, textt, index);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.delete, size: 30),
                onPressed: () {
                  setState(() {
                    _shoppingList.remove(textt);
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
