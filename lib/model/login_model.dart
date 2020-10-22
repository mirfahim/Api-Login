// class LoginResponseModel {
//   final String token;
//   final String error;
//
//   LoginResponseModel({this.token, this.error});
//
//   factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
//     return LoginResponseModel(
//       token: json["token"] != null ? json["token"] : "",
//       error: json["error"] != null ? json["error"] : "",
//     );
//   }
// }
//
// class LoginRequestModel {
//   String email;
//   String password;
//   String username;
//
//   LoginRequestModel({
//     this.email,
//     this.password,
//     this.username,
//   });
//
//   Map<String, dynamic> toJson() {
//     Map<String, dynamic> map = {
//       // 'email': email.trim(),
//       'username': username.trim(),
//       'password': password.trim(),
//     };
//
//     return map;
//   }
// }
