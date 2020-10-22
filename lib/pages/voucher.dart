import 'package:flutter/material.dart';

class Voucher extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return MyCard(isPressed: false);
          }),
    );
  }
}

class MyCard extends StatefulWidget {
  final bool isPressed;

  const MyCard({Key key, this.isPressed}) : super(key: key);
  @override
  _MyCardState createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  bool _isPressed;

  @override
  void initState() {
    _isPressed = widget.isPressed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: _isPressed ? Colors.blueAccent : Colors.grey,
      child: InkWell(
        onTap: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
        child: Container(
          height: 50,
        ),
      ),

    );
  }
}
