// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:revio/models/user_model.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreArtistItem extends StatelessWidget {
  final User artist;

  GenreArtistItem({Key? key, required this.artist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/user1.png',
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ]),
        Column(children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 10.0),
            child: Text(artist.displayName,
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 20)),
          ),
        ]),
        Column(children: [
          Container(
            margin: EdgeInsets.only(left: 80, top: 10.0),
            child: Text("32 songs",
                style: GoogleFonts.roboto(color: Colors.white, fontSize: 20)),
          ),
        ]),
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'assets/images/play.png',
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          )
        ]),
      ]),
      /* Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width / 1.2,
                  color: Colors.black))
        ]), */
    );
  }
}
