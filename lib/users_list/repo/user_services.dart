import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mvvm_implementation/users_list/models/user_model.dart';
import 'package:mvvm_implementation/users_list/repo/api_statuses.dart';
import 'package:mvvm_implementation/utils/constants.dart';

class UserServices{
  static Future<Object> getUsers()async{
    try{
      var url = Uri.parse(USERS_LIST);
      var response = await http.get(url);
      // print("API response: ${response.body}");
      if(response.statusCode == 200){
        return Success(code: response.statusCode, response: userModelFromJson(response.body));
      }
      return Failure(code: userInvalidCode, errorResponse: "Invalid Response");
  } on HttpException{
      return Failure(code: noInternet, errorResponse: "No Internet");
    } on FormatException{
      return Failure(code: invalidFormat, errorResponse: "Invalid Format");
    }on SocketException{
      return Failure(code: noInternet, errorResponse: "No Internet");
    }
  catch (e){
    return Failure(code: unknownError, errorResponse: "Unknown Error");
    }
    
    }
}