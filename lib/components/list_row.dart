import 'package:flutter/material.dart';
import 'package:mvvm_implementation/users_list/models/user_model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UserModel userModel;
  const UserListRow({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitle(text: userModel.name!,),
          Text(userModel.email!),
        ],
      ),
    );
  }
}
