import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  final notification ;
 final user_name;
 final api_token;
  const DetailPage({ this.notification, this.api_token, this.user_name});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Container(
        child: Center(
            child: Text("Details")),
      ),
    );
  }
}
