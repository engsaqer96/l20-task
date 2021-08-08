import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_mangment_project/providers/myprovider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          Provider.of<MyProvider>(context).myName,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25),
        ),
        ElevatedButton(
          child: Text("change"),
          onPressed: () {
            print(Provider.of<MyProvider>(context, listen: false)
                .changNameVlaue('Ahmed'));
          },
        ),
      ],
    ));
  }
}
