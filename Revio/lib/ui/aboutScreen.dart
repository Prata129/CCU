import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
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
              title: Text("About",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
            ),
            Text(
                "\nREVIO is an app that aims to connect you, the listener, with upcoming artists that need your support to grow. In return you gain access to exclusive discounts for shows and other perks. To support the in-app transactions and offer full transparency to both listeners and artists, REVIO uses blockchain technology and its own token Chainio.",
                style: TextStyle(fontSize: 28.0, color: Color(0xFFC2C2C2))),
          ],
        ),
      ),
    );
  }
}
