
import 'package:flutter/material.dart';
import 'package:mvvm_implementation/users_list/views/add_new_user.dart';
import 'package:mvvm_implementation/users_list/views/user_detail_screen.dart';

void openUserDetails(BuildContext context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => const UserDetailScreen()));
}

void openAddNewUser(BuildContext context) async{
  Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewUser()));
}