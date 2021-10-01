import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:miafona/modules/signUp/models/user.dart';

Future createUser(String name , String password) async {
  final url = "http://192.168.43.80:3000/";
  final dio = Dio();
  
  final response = await dio.post(
    url,
    data:{
      'name': name,//{name},
      'password': password//{password}
    }
  );
  if (response.statusCode == 201) {
    return User.fromJson(jsonDecode(response.data!));
  } else {
    return null;
  }
}