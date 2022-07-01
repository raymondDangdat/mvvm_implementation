import 'package:flutter/material.dart';
import 'package:mvvm_implementation/users_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

import 'users_list/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserViewModel()),
    ],
    child: MaterialApp(
      title: 'MVVM Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ),);
  }
}

