import 'package:app/model/login_model.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';

class APIService{
  // static Future<bool> login(LoginRequestModel requestModel) async{
  //   //String url ="http://10.0.2.2/api/login";
  //
  //   final response = await http.post(Uri.http("http://10.0.2.2","/api/login"), body:{
  //     'username':requestModel.email,
  //     'password':requestModel.password,
  //   }
  //   );
  //   if(response.statusCode == 200 || response.statusCode == 400){
  //     //return LoginResponseModel.fromJson(json.decode(response.body));
  //     return true;
  //   } else {
  //     throw Exception('Failed to Load data');
  //   }
  //
  //
  // }

  static Future<bool> testGet() async{
    //String url ="http://10.0.2.2/api/login";

    final response = await http.get(Uri.https("jsonplaceholder.typicode.com","/posts/1")
    );
    if(response.statusCode == 200 || response.statusCode == 400){
      //return LoginResponseModel.fromJson(json.decode(response.body));
      return true;
    } else {
      throw Exception('Failed to Load data');
    }


  }
}