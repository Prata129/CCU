// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revio/ui/myFans.dart';

class Shoutout extends StatelessWidget {
  String _fanName;
  int _fanId;
  Shoutout({required String fanName, required int fanId})
      : _fanName = fanName,
        _fanId = fanId;

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Published!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: Padding(
              padding: EdgeInsets.only(right: 40),
              child: Container(
                width: 141,
                height: 56,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 189, 88),
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyFans()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          '       Shout It!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
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
                    Navigator.pop(context);
                  }),
              iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
              backgroundColor: Color(0xFF222222),
              title: Text("${_fanName}",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10),
                child: Container(
                  width: 164,
                  height: 164,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(
                        'assets/images/user${_fanId}.png',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Text(
                '     Total Streams: 120\n        Contribution: 12',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: EdgeInsets.only(top: 15),
                  child: Stack(children: [
                    Container(
                        height: 170,
                        width: 245,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              'assets/images/shoutBaloon.png',
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: TextField(
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 50,
                                  horizontal: 5,
                                ),
                                filled: true,
                                fillColor: Color.fromARGB(255, 255, 255, 255),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                labelStyle: TextStyle(color: Colors.white),
                                hintText:
                                    'Write something nice to ${_fanName}!'),
                          ),
                        )),
                  ])),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: EdgeInsets.only(right: 40),
                child: Container(
                  width: 141,
                  height: 56,
                  //color: Color.fromARGB(255, 58, 169, 206),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 189, 88),
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog(context),
                      );
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            '       Shout It!',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
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
        ));
  }
}
