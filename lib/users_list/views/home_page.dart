import 'package:flutter/material.dart';
import 'package:mvvm_implementation/components/app_error.dart';
import 'package:mvvm_implementation/components/app_loading.dart';
import 'package:mvvm_implementation/components/list_row.dart';
import 'package:mvvm_implementation/users_list/view_models/user_view_model.dart';
import 'package:mvvm_implementation/utils/navigation_utils.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users List"),
        actions: [
          IconButton(onPressed: (){
            openAddNewUser(context);
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Container(
          child: _ui(userViewModel),
        ),
      ),
    );
  }

  _ui(UserViewModel userViewModel) {
    if(userViewModel.loading){
      return const AppLoading();
    }

    if(userViewModel.userError != null){
      return Container(
        alignment: Alignment.center,
          child: Error(errorText: userViewModel.userError!.message.toString(),));
    }
    
    return Column(
      children: [
        const SizedBox(height: 25,),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index){
                  final user = userViewModel.usersList[index];
                  return InkWell(
                    onTap: (){
                      userViewModel.setSelectedUser(user);
                      openUserDetails(context);
                    },
                      child: UserListRow(userModel: user));
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: userViewModel.usersList.length))
      ],
    );
  }
}
