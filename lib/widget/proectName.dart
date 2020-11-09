import 'package:flutter/material.dart';

class ProjectName extends StatefulWidget {

  @override
  _ProjectNameState createState() => _ProjectNameState();
}

class _ProjectNameState extends State<ProjectName> {
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
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text("Project1"),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Project2"),
                value: 2,
              ),
              DropdownMenuItem(
                  child: Text("Project3"),
                  value: 3
              ),
              DropdownMenuItem(
                  child: Text("Project4"),
                  value: 4
              )
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
