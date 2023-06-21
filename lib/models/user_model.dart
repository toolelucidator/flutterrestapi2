// import 'package:flutterrestapi2/entitites/user.dart';
//
// class UserModel extends User {
//   UserModel();
//   UserModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     name = json['data']['Name'];
//     token = json['data']['Token'];
//   }
// }
//
// class Data {
//   String? name;
//   String? token;
//   Data({this.name, this.token});
//   Data.fromJson(Map<String, dynamic> json) {
//     name = json['Name'];
//     token = json['Token'];
//   }
// }
//TODO MODIFY TO USE PURE ENTITIES
class UserModel {
  int? code;
  String? message;
  Data? data;

  UserModel({this.code, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? token;

  Data({this.name, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['Token'] = this.token;
    return data;
  }
}