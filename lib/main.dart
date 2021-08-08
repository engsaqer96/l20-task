import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_project/providers/myprovider.dart';
import 'package:state_mangment_project/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
      create: (context) => MyProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
