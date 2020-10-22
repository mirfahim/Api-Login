
import 'package:api_login/pages/details.dart';
import 'package:api_login/pages/homepage.dart';
import 'package:api_login/pages/listPage.dart';
import 'package:api_login/pages/settingPage.dart';
import 'package:api_login/pages/voucher.dart';
import 'package:flutter/material.dart';



class Button extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return
    Container(
      color: Colors.lightBlue,
      height:50,
    child:Row(children: <Widget>[

    Container(
    width: 40,
    ),


    GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                    Voucher()));
      },
      child: Container(
      height: 80,
      width: 80,
      child: Icon(
      Icons.payment,
      size: 60,
      color: Colors.white,
      ),
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment(-2.0, -10.0),
      end: Alignment(2.0, 10.0),
      colors: [
      Color(0xFF5bc6ff),
      Color(0xFF4da7db),
      ]),
      borderRadius: BorderRadius.all(Radius.circular(35)),
      boxShadow: [
      BoxShadow(
      color: Color(0xFF4ca5d8),
      offset: Offset(5.0, 5.0),
      blurRadius: 10.0,
      spreadRadius: 1.0),
      BoxShadow(
      color: Color(0xFF5ecdff),
      offset: Offset(-5.0, -5.0),
      blurRadius: 10.0,
      spreadRadius: 1.0),
      ]),
      ),
    ),








//................................new row two........................................
    Container(
    width: 30,
    ),


    GestureDetector(
      onTap: () {
    Navigator.push(
    context,
    new MaterialPageRoute(
    builder: (BuildContext context) =>
    ListPage()));

    },
      child: Container(
      height: 80,
      width: 80,
      child: Icon(
      Icons.list,
      size: 60,
      color: Colors.white,
      ),
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment(-2.0, -10.0),
      end: Alignment(2.0, 10.0),
      colors: [
      Color(0xFF5bc6ff),
      Color(0xFF4da7db),
      ]),
      borderRadius: BorderRadius.all(Radius.circular(35)),
      boxShadow: [
      BoxShadow(
      color: Color(0xFF4ca5d8),
      offset: Offset(5.0, 5.0),
      blurRadius: 10.0,
      spreadRadius: 1.0),
      BoxShadow(
      color: Color(0xFF5ecdff),
      offset: Offset(-5.0, -5.0),
      blurRadius: 10.0,
      spreadRadius: 1.0),
      ]),
      ),
    ),




// new row three


    Container(
    width: 30,
    ),
    GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) =>
                    SettingPage()));

      },
      child: Container(
      height: 80,
      width: 80,
      child: Icon(
      Icons.settings,
      size: 60,
      color: Colors.white,
      ),
      decoration: BoxDecoration(
      gradient: LinearGradient(
      begin: Alignment(-2.0, -10.0),
      end: Alignment(2.0, 10.0),
      colors: [
      Color(0xFF5bc6ff),
      Color(0xFF4da7db),
      ]),
      borderRadius: BorderRadius.all(Radius.circular(35)),
      boxShadow: [
      BoxShadow(
      color: Color(0xFF4ca5d8),
      offset: Offset(5.0, 5.0),
      blurRadius: 10.0,
      spreadRadius: 1.0),
      BoxShadow(
      color: Color(0xFF5ecdff),
      offset: Offset(-5.0, -5.0),
      blurRadius: 10.0,
      spreadRadius: 1.0),
      ]),
      ),
    ),


    ], ),
    );

  }}