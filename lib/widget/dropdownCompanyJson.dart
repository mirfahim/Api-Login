import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownCompany extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DropDownCompany> {
 String   _mySelection   ;

  final String url = "http://www.accounting.emicrodev.com/api/company";

  List data = List(); //edited line

  Future<String> getSWData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var resBody = json.decode(res.body);

    setState(() {
      data = resBody;
    });

    print(resBody);

    return "Success";
  }

  @override
  void initState() {
    super.initState();
    this.getSWData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 244,
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonHideUnderline(
        child: new DropdownButton(
          hint: Text('Select Company'),
          items: data.map((item) {
            return new DropdownMenuItem(
              child: new Text(
                item['name'],
                style: TextStyle(fontSize: 12),
              ),
              value: item['id'].toString(),
            );
          }).toList(),
          onChanged: (newVal) {
            setState(() {
              _mySelection = newVal;
            });
          },
          value: _mySelection,
        ),
      ),
    );
  }
}
