// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyFans extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: //SingleChildScrollView(
          Column(children: [
        AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
          backgroundColor: Color(0xFF222222),
          title: Text("My Fans",
              style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
          elevation: 0,
        ),
      ]),
      //),
    );
  }
}
