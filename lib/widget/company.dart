import 'package:flutter/material.dart';

class CompanyName extends StatefulWidget {

  @override
  _CompanyNameState createState() => _CompanyNameState();
}

class _CompanyNameState extends State<CompanyName> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return  DropdownButton(
        value: _value,
        items: [
          DropdownMenuItem(
            child: Text("Atlanta"),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text("HillCreast"),
            value: 2,
          ),
          DropdownMenuItem(
              child: Text("Right Brain Solution", style: TextStyle(fontSize: 14),),
              value: 3
          ),
          DropdownMenuItem(
              child: Text("PUL Group"),
              value: 4
          )
        ],
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        });

  }
}
