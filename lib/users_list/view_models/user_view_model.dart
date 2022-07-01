import 'package:flutter/material.dart';
import 'package:mvvm_implementation/users_list/models/user_error.dart';
import 'package:mvvm_implementation/users_list/models/user_model.dart';
import 'package:mvvm_implementation/users_list/repo/api_statuses.dart';
import 'package:mvvm_implementation/users_list/repo/user_services.dart';

class UserViewModel extends ChangeNotifier{
  bool _loading = false;
  List<UserModel> _usersList = [];
  UserError? _userError;

  bool get loading => _loading;
  List<UserModel> get usersList => _usersList;
  UserError get userError => _userError!;

  setLoading(bool loading)async{
    _loading = loading;
    notifyListeners();
  }

  setUsersList(List<UserModel> usersList){
    _usersList = usersList;
  }

  setUseError(UserError userError){
    _userError = userError;
  }

  getUsers() async{
    setLoading(true);

    var response = await UserServices.getUsers();

    if(response is Success){
      setUsersList(response.response as List<UserModel>);
    }

    if(response is Failure){
      UserError(code: response.code, message: response.errorResponse);
    }

    setUseError(userError);

    setLoading(false);
  }
}