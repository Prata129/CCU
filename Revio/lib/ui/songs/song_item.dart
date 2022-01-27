// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/models/artist_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SongItem extends StatelessWidget {
  final Song song;

  SongItem({Key? key, required this.song}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(song.name, style: TextStyle(color: Colors.white),)
        ],
      )
    );
  }
}
