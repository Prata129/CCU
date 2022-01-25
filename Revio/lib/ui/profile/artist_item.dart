// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:revio/models/artist_model.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistItem extends StatelessWidget {
  final Artist artist;

  ArtistItem({Key? key, required this.artist}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                child: Icon(Icons.person, color: Colors.grey, size: 120.0),
              )
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10.0),
                child: Text(
                  artist.name,
                  style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 20
                )
              ),
              ),
              Container(
                margin: EdgeInsets.only(top:5.0),
                child: Text(
                  "Current Rank: " + artist.getRankName(),
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 10,
                    ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:5.0),
                child: Text(
                  "Times Listened: " + artist.timesListened.toString(),
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 10,
                  )
                )
              ),
              Container(
                margin: EdgeInsets.only(top:5.0),
                child: Text(
                  "Your contribution this month: ",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 10,
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:5.0),
                child: IntervalProgressBar(
                  max: 20,
                  progress: artist.timesListened,
                  intervalSize: 1,
                  size: Size(200, 10),
                  highlightColor: Colors.yellow,
                  defaultColor: Colors.grey,
                  intervalColor: Colors.transparent,
                  intervalHighlightColor: Colors.transparent,
                  radius: 0, 
                )
              )
          ])
        ]
      )
    );
  }
}
