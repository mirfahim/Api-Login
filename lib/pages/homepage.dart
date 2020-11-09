import 'package:api_login/model/response_model.dart';
import 'package:api_login/pages/details.dart';
import 'package:api_login/pages/createHandslip.dart';
import 'package:api_login/widget/delete_card.dart';
import 'package:api_login/widget/neumorphsm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../sharePreference.dart';
import 'login.dart';
import 'login.dart';

class HomePage extends StatefulWidget {

  final List<dynamic> notification;
  final payment;
  final count;
  String user_name;
  String company_name;
  final api_token;
  final user_id;
  final payment_id;

  // List data ;
  HomePage({
    this.user_name,
    this.api_token,
    this.user_id,
    @required this.notification,
    this.count,
    this.payment,
    this.payment_id,
    this.company_name,

  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isPressed = false;
  String arrayLength;
  String nametoprint;
  String tokentoprint;

  @override
  void initState() {

    super.initState();
    Future name = SharedPrefrence().getName();
    name.then((data) async {
      nametoprint = data;
      print(nametoprint);
    });
    Future token = SharedPrefrence().getToken();
    token.then((data) async {
      tokentoprint = data;
      print(tokentoprint);
    });
  }

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  int counter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                const Color(0xFF3366FF),
                const Color(0xFF00CCFF),
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Cash-Management"),
            flexibleSpace: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF3366FF),
                      const Color(0xFF00CCFF),
                    ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
            ),
            actions: [
              new Stack(
                children: <Widget>[
                  new IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        setState(() {
                          counter = 0;
                        });
                        setState(() {
                          isPressed = !isPressed;
                        });

                      }),
                  counter != 0
                      ? new Positioned(
                          right: 11,
                          top: 11,
                          child: new Container(
                            padding: EdgeInsets.all(2),
                            decoration: new BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 14,
                              minHeight: 14,
                            ),
                            child: Text(
                              "  ${widget.notification.length} ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      : new Container()
                ],
              ),
              IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }),
            ],
          ),
          body: ListView(
            children: <Widget>[
              Card(
                
                color: Colors.lightBlue,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (BuildContext context) =>
                                new CreateHandSlipPage()));
                  },
                  child: Container(
                    height: 110,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Profile",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${widget.user_name}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${widget.company_name}",
                          style: TextStyle(fontSize: 16),
                        ),
                        // Text(
                        //   "  ${widget.notification.length} ",),
                        // Text(" ${nametoprint} "),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          const Color(0xFF3366FF),
                          const Color(0xFF00CCFF),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  height: 430,
                  child: ListView.builder(
                      itemCount: widget.notification == null
                          ? 0
                          : widget.notification.length,
                      itemBuilder: (context, index) {
                        final count = widget.notification;
                        print(count.length);

                        return Dismissible(
                          key: ValueKey(
                              widget.notification[index]["id"].toString()),
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
                                borderRadius: BorderRadius.circular(10.0)),
                            color: isPressed ? Colors.white54 : Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: InkWell(
                                onTap: () {

                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new DetailPage()));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Status',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 67,
                                        ),
                                        Text(widget.notification[index]["data"]
                                                ["message"]
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Amount',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 55,
                                        ),
                                        Text(widget.notification[index]["data"]
                                                ["amount"]
                                            .toString()),

                                        Container(
                                            width: 25,
                                            height: 20,
                                            child: Image(image: AssetImage('asset/taka.png'))),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Created at',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                        Text(widget.notification[index]
                                                ["created_at"]
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
              Container(
                  decoration: new BoxDecoration(
                    gradient: new LinearGradient(
                        colors: [
                          const Color(0xFF3366FF),
                          const Color(0xFF00CCFF),
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  height: 130, child: Button()),
            ],
          ),

          // floatingActionButton: FloatingActionButton(onPressed: () {
          //   print("Increment Counter");
          //   setState(() {
          //     counter++;
          //   });
          // }, child: Icon(Icons.add),),
        ),
      ),
    );
  }
}
