import 'package:flutter/material.dart';
import 'package:mvvm_implementation/users_list/models/user_error.dart';
import 'package:mvvm_implementation/users_list/models/user_model.dart';
import 'package:mvvm_implementation/users_list/repo/api_statuses.dart';
import 'package:mvvm_implementation/users_list/repo/user_services.dart';

class UserViewModel extends ChangeNotifier{
  bool _loading = false;
  List<UserModel> _usersList = [];
  UserError? _userError;
  UserModel? _selectedUser;
  UserModel _addUSer = UserModel();

  bool get loading => _loading;
  List<UserModel> get usersList => _usersList;
  UserError? get userError => _userError;

  UserModel get selectedUser => _selectedUser!;
  UserModel get addedUser => _addUSer;



  UserViewModel(){
    getUsers();
  }


  Future<bool> addUser()async{
    if(!isValid()){
      return false;
    }
    _usersList.add(addedUser);
    _addUSer = UserModel();
    notifyListeners();

    return true;
    }

   isValid(){
    if(addedUser.name == null || addedUser.name!.isEmpty){
      return false;
    }

    if(addedUser.email == null || addedUser.email!.isEmpty){
      return false;
    }

    return true;
  }

  setLoading(bool loading)async{
    _loading = loading;
    notifyListeners();
  }

  setSelectedUser(UserModel userModel){
    _selectedUser = userModel;
  }

  setUsersList(List<UserModel> usersList){
    _usersList = usersList;
  }

  setUseError(UserError? userError){
    _userError = userError;
  }

  getUsers() async{
    setLoading(true);

    var response = await UserServices.getUsers();

    if(response is Success){
      setUsersList(response.response as List<UserModel>);
    }

    if(response is Failure){
      final userError =  UserError(code: response.code, message: response.errorResponse);
      setUseError(userError);
    }




    setLoading(false);
  }
}