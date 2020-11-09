import 'package:api_login/pages/listPage.dart';
import 'package:api_login/widget/cardOfUserandCompany.dart';
import 'package:api_login/widget/company.dart';
import 'package:api_login/widget/creatItemandAmount.dart';
import 'package:api_login/widget/createItemCard.dart';
import 'package:api_login/widget/delete_card.dart';
import 'package:api_login/widget/proectName.dart';
import 'package:api_login/widget/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateHandSlipPage extends StatefulWidget {
  @override
  _CreateHandSlipPageState createState() => _CreateHandSlipPageState();
}

class _CreateHandSlipPageState extends State<CreateHandSlipPage> {
  var amount;

  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  var _addCard = 0;
  void _incrementCard() {
    setState(() {
      _addCard++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.blue, Colors.white],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Create Handslip'),
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0xFF3366FF),
                    const Color(0xFF00CCFF),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCard,
          child: Icon(Icons.add),
          backgroundColor: Colors.blue,
        ),
        body: ListView(children: <Widget>[
          CardOfUserAndCompany(),

          // 1st card end ..................1st card end

          Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.blue, Colors.white],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 70,
                  child: Text(
                    "Total",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                Container(
                  width: 200,
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          "$amount",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                      ),
                      Container(
                          width: 30,
                          height: 40,
                          child: Image(image: AssetImage('asset/taka.png'))),
                    ],
                  ),
                ),
                Container(
                  color: Colors.lightBlue,
                  width: 100.0,
                  height: 70.0,
                  child: RaisedButton(
                    child: Text(
                      " Save",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => AreYouSure(),
                      );
                    },
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                    splashColor: Colors.grey,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                ),
              ],
            ),
          ),
          // project start.......2nd card........................project
          Container(
            height: 445,
            child: ListView.builder(
                itemCount: _addCard,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(null),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {},
                    confirmDismiss: (direction) {
                      return showDialog(
                          context: context, builder: (_) => DeleteCard());
                    },
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      color: Colors.white70,
                      child: Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment(-1.0, -1.0),
                              child: Text(
                                "${index + 1}",
                              )),
                          Row(
                            children: <Widget>[
                              Container(
                                width: 120,
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  "Project ",
                                  style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.0),
                                child: ProjectName(),
                              ),
                            ],
                          ),

                          // item add start

                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              onChanged: (value) => setState(() {}),
                              decoration: InputDecoration(
                                hintText: "Item name",
                                hintStyle: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.0),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  amount = value;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: "Amount",
                                hintStyle: TextStyle(fontSize: 12),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),

// 2nd card end.............
        ]),
      ),
    );
  }
}
