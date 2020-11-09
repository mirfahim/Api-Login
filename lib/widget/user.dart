import 'package:flutter/material.dart';

class UserName extends StatefulWidget {

  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 244,
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            hint: Text('Select User'),
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text("Admin1"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Admin2"),
                value: 2,
              ),
              DropdownMenuItem(
                  child: Text("Admin3"),
                  value: 3
              ),
              DropdownMenuItem(
                  child: Text("Admin4"),
                  value: 4
              ),
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            }),
      ),
    );

  }
}
