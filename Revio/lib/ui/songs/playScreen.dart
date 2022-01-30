import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:revio/models/OneSong_model.dart';

class PlayScreen extends StatelessWidget {
  final Song _song;
  const PlayScreen({required Song song}) : _song = song;



  @override
  Widget build(BuildContext context) {
    return Scaffold(       
        backgroundColor: const Color(0xFF222222),
        body: Column(children: [
          AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
            iconTheme: IconThemeData(color: const Color(0xFFC2C2C2)),
            backgroundColor: Color(0xFF222222),
            title: Text(_song.name,
                style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
            elevation: 0,
          ),
          Stack(children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                "assets/images/adele25.jpg",
                alignment: Alignment.center,
              ),
            )
            ]
          ,)
        ]
      )
    );
  }
  
}