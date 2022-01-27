// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revio/ui/shoutout.dart';
import 'package:revio/ui/ArtistManager.dart';

class MyFans extends StatelessWidget {
  Widget _buildRows(String fanName, int fanId, BuildContext context) {
    return Row(children: [
      Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  'assets/images/user${fanId}.png',
                ),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ]),
      Column(children: [
        Row(children: [
          Text(
            '${fanName}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
          Text(
            'Total Streams: 120',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Contribution: 12',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              width: 146,
              height: 32,
              //color: Color.fromARGB(255, 58, 169, 206),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 229, 189, 88),
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Shoutout(fanName: fanName, fanId: fanId)));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        '       Give Shoutout',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
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
    ]);
  }

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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArtistManager()));
                  }),
              iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
              backgroundColor: Color(0xFF222222),
              title: Text("My Fans",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(children: [
                Container(
                  child: Text('Check Your Fans',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
              ]),
            ),
            _buildRows('João', 1, context),
            _buildRows('Joana', 2, context),
            _buildRows('Rute', 3, context),
            _buildRows('Igor', 4, context),
          ]),
        ));
  }
}
