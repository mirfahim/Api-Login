import 'package:flutter/material.dart';

import 'login.dart';

class HomePage extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [

        ],
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Signout'),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            );
          },
        ),
      ),
    );
  }
}