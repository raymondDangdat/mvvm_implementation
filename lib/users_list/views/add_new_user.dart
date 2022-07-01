import 'package:flutter/material.dart';
import 'package:mvvm_implementation/users_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class AddNewUser extends StatelessWidget {
  const AddNewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel userViewModel = context.watch<UserViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
        actions: [
          IconButton(onPressed: ()async{
            final bool userAdded = await userViewModel.addUser();

            if(userAdded){
             Navigator.pop(context);
            }
          }, icon: const Icon(Icons.save))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (val)async{
                userViewModel.addedUser.name = val;
              },
              decoration: const InputDecoration(hintText: "Name"),
            ),

            const SizedBox(height: 10,),

            TextFormField(
              onChanged: (val)async{
                userViewModel.addedUser.email = val;
              },
              decoration: const InputDecoration(hintText: "Email"),
            ),
          ],
        ),
      ),
    );
  }
}
