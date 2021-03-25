import 'package:app/model/login_model.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';

class APIService{
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async{
   // String Uri ="http://10.0.2.2/api/login";

    final response = await http.post(Uri.http("http://10.0.2.2","/api/login"), body: requestModel.toJson());
    if(response.statusCode ==200 || response.statusCode == 400){
      return LoginResponseModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Load data');
    }


  }
}