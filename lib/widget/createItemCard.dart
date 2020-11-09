import 'package:api_login/test/todomodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    Container(
      height:400,

          decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(60)), color: Colors.white),
          child: Consumer<TodoModel>(
            builder: (context, todo, child){
              return ListView(
                children:<Widget>[
                  ListView.builder(
                      itemCount: todo.tasklist.length,
                      itemBuilder: (context, index){
                        return Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.only(left: 32, right: 32, top: 8, bottom: 8),
                            title: Text(todo.tasklist[index].name, style : TextStyle(color: Colors.black87,
                                fontWeight: FontWeight.bold),),
                            subtitle: Text(todo.tasklist[index].detail, style: TextStyle(color: Colors.black45,
                                fontWeight: FontWeight.bold),),

                            trailing: Icon(Icons.check_circle, color: Colors.greenAccent,),
                          ),
                          margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                        );
                      }
                  ),
                ]
              );
            },
          )



    );
  }
}
