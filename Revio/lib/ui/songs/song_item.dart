// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/models/artist_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SongItem extends StatelessWidget {
  final Song song;

  ///////////////////////////////////////////////////////
  ///
  ///
  ///                       Change songs to have display name
  ///
  ///
  /// ///

  SongItem({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(
            0.0), //Rafael: padding 0 to correct overflow in my device
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    child: Icon(Icons.music_note_sharp,
                        color: Color(0xFFE5BE58), size: 100.0),
                  )),
            ),
            SizedBox(
                width: 80,
                child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(song.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Color(0xFF979797))))),
            SizedBox(
                width: 150,
                child: Padding(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text(song.artist,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            color: Color(0xFF979797))))),
            Container(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    child: Icon(Icons.play_arrow,
                        color: Color(0xFFC4C4C4), size: 60.0),
                  )),
            ),
          ],
        ));
  }
}
