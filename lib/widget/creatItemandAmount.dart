import 'package:api_login/widget/delete_card.dart';
import 'package:api_login/widget/proectName.dart';
import 'package:flutter/material.dart';

class CreateItemAndAmount extends StatefulWidget {

  @override
  _CreateItemAndAmountState createState() => _CreateItemAndAmountState();
}

class _CreateItemAndAmountState extends State<CreateItemAndAmount> {

  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  String result = "0";

  @override
  Widget build(BuildContext context) {
    return Container(

      height: 445,
      child: ListView.builder(
          itemCount: 5,
        itemBuilder: (context, index) {
          return Dismissible(
            key:Key(null),
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
                  Row(
                    children: <Widget>[
                      Container(
                        width: 120,
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Project ",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold),
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
                      decoration: InputDecoration(
                        hintText: "Item name" ,hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Amount",hintStyle: TextStyle(fontSize: 12),

                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
