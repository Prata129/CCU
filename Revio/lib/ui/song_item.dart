import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SongItem extends StatelessWidget {
  final Song song;
  final int index;

  SongItem({Key? key, required this.song, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Row(children: [
              Container(
                width: 5,
                height: 130,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(0, 229, 189, 88),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                  width: 140,
                  height: 140,
                  child: Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(
                            'assets/images/song$index.png',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment
                            .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            song.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ),
                  ])),
            ])),
      ],
    );
  }
}
