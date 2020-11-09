import 'package:api_login/widget/company.dart';
import 'package:api_login/widget/dropdownCompanyJson.dart';
import 'package:api_login/widget/user.dart';
import 'package:flutter/material.dart';

class CardOfUserAndCompany extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 120,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "User",
                  style:
                  TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: UserName(),
              ),
            ],
          ),

          // company start

          Row(
            children: <Widget>[
              Container(
                width: 120,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Company",
                  style:
                  TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: DropDownCompany(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
