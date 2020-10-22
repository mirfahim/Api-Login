// import 'package:api_login/model/response_model.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http ;
//
// class ResponseServices {
//
//   static  const String url = "http://www.accounting.emicrodev.com/api/login";
//
//   static Future <List<UserInfo>> getUser() async{
//     try{
//       final responsedata = await http.get(url);
//       if (200 == responsedata.statusCode){
//         final List<UserInfo> userInfo =  userInfoFromJson(responsedata.body);
//             return userInfo ;
//       }
//
//     }
//     catch(e){
//       return List<UserInfo>();
//     }
//
//   }
//
// }