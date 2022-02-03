import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SongItem extends StatelessWidget {
  final Song song;

  SongItem({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: SizedBox(
              width: 140,
              height: 140,
              child: Stack(children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.scaleDown,
                      image: AssetImage(
                        'assets/images/adele25.jpg',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                /* Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black,
                        ],
                        stops: const [
                          0,
                          1
                        ]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ), */
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
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ])),
        ),
      ],
    );
  }
}
