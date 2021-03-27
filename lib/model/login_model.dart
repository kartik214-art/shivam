import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginResponseModel{
  final String token;
  final String error;
  LoginResponseModel({
    this.token, this.error
});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json){
    return LoginResponseModel(token:  json["token"] != null ? json["token"]:"",
      error:json["error"] != null ? json["error"] : "",);
  }

}


class LoginRequestModel{
  String email;
  String password;

  LoginRequestModel({
  @required this.email,
  @required this.password,
});


  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
        email: json['email'],
        password: json['password']
    );
  }
  // Map<String,dynamic> toJson(){
  //   Map<String,dynamic> map ={
  //     'email':email.trim(),
  //     'password':password.trim(),
  //   };
  //   return map;
  // }
}