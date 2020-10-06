import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'homepage.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {


  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  bool _isLoading = false;


  // arrange method for api log in

  signIn(String email, String password) async {
    String url = "https://reqres.in/api/login";

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map body = { "email": email, "password": password
    };

    var jsonResponse;
    var res = await http.post(url, body: body);

    //need to check the api status

    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print("Response status: ${res.statusCode}");
      print("Response status: ${res.body}");

      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });

        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext) => HomePage()),
                (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading == false;
      });
      print(" Response status : ${res.body}");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Text("email:eve.holt@reqres.in"),
                Text("password: cityslicka"),
                Text("Login",
                style: TextStyle(fontSize: 32),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(hintText: "Email"),

                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,


                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text("Sign In"),
                    onPressed: _emailController.text == ""||
                        _passwordController.text == ""
                        ? null
                        : () {
                      setState(() {
                        _isLoading = true ;

                      });
                      signIn(_emailController.text, _passwordController.text);
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                  child: Text("Forgot password"),
                      onPressed: (){

          },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
