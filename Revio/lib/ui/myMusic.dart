// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(children: [
          AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
            iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
            backgroundColor: Color(0xFF222222),
            title: Text("My Music",
                style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
            elevation: 0,
          ),
//**************Add Music********************

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 256,
                height: 56,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 189, 88),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          '     Add Music',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        ]),
      ),
    );
  }
}
