import 'package:flutter/material.dart';
import 'package:revio/ui/aboutScreen.dart';
import 'package:revio/ui/auth/loginpage.dart';

class AlbumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
              backgroundColor: Color(0xFF222222),
              title: Text("Settings",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 40),
              height: 68,
              width: 390,
              decoration: BoxDecoration(
                  color: const Color(0x80C4C4C4),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  )),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Payments',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 25),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              //margin: const EdgeInsets.only(top: 40),
              height: 68,
              width: 390,
              decoration: BoxDecoration(color: const Color(0x80C4C4C4)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutScreen()));
                },
                child: const Text(
                  'About',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 25),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              //margin: const EdgeInsets.only(top: 40),
              height: 68,
              width: 390,
              decoration: BoxDecoration(
                  color: const Color(0x80C4C4C4),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
