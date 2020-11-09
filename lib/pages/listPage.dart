import 'package:api_login/widget/proectName.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  bool _isLoading = true;
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _getListData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 400,
          margin: EdgeInsets.all(10),
          child: !_isLoading && _items.isEmpty
              ? Center(
            child: Text("No data found"),
          )
              : (_isLoading && _items.isEmpty)
              ? Container(
            color: Colors.transparent,
            child: Center(
              child: CircularProgressIndicator(
                valueColor:
                AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            ),
          )
              : ListView.builder(
            itemCount: _items.length,
            itemBuilder: (context, index) {
              return _createListRow(_items[index], index);
            },
          ),
        ),
      ),
    );
  }

  _createListRow(String item, int index) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0)),
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 150,
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Project Name",
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: ProjectName(),
              ),
            ],
          ),

          // item add start

          Container(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Item name",
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children:<Widget> [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Amount",
                  ),
                ),

                FlatButton(
                  child: Text("Delete"),
                  onPressed: () {
                    setState(() {
                      _items.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getListData() {
    //  Create dynamic list
    Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _items.add;
      _items.add;

      _isLoading = false;
    });
  }
}
