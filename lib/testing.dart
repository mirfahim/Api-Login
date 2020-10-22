import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;





class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UsersDetail> _list = [];
  var loading = false;
  Future<Null> _fetchData() async {
    setState(() {
      loading = true;
    });
    final response =
    await http.get("https://jsonplaceholder.typicode.com/users");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(UsersDetail.fromJson(i));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Container(
        child: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, i) {
            final x = _list[i];
            return GestureDetector(


              child:Card(
                child:Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(x.name),
                      Text(x.email),
                      Text(x.phone),
                      Text(x.website),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(x.address.street),
                      Text(x.address.suite),
                      Text(x.address.city),
                      Text(x.address.zipcode),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Company",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold),
                      ),
                      Text(x.company.name),
                      Text(x.company.catchPhrase),
                      Text(x.company.bs),

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}




// model


class UsersDetail {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  UsersDetail(
      {this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company});

  factory UsersDetail.fromJson(Map<String, dynamic> json) {
    return new UsersDetail(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company']),
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({this.street, this.suite, this.city, this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return new Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }
}

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({this.name, this.catchPhrase, this.bs});
  factory Company.fromJson(Map<String, dynamic> json) {
    return new Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs'],
    );
  }
}