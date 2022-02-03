import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:google_fonts/google_fonts.dart';

class SongPlaylistItem extends StatelessWidget {
  final Song song;

  SongPlaylistItem({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            addToPlaylist(song, context);
          },
          child: Padding(
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
                  ),
                  const Divider(
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 0,
                  ),
                ])),
          ),
        )
      ],
    );
  }

  addToPlaylist(Song song, BuildContext context) {
    song.inPlaylist = true;
    Navigator.pop(context);
  }

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Song Sumbited!\nWait for analysis',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 48,
                color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      ),
      actions: <Widget>[
        Container(
          child: FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              textColor: Theme.of(context).primaryColor,
              child: Padding(
                padding: EdgeInsets.only(right: 40),
                child: Container(
                  width: 10,
                  height: 10,
                  //color: Color.fromARGB(255, 58, 169, 206),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 229, 189, 88),
                      borderRadius: BorderRadius.circular(20)),
                  child: InkWell(
                    onTap: () {
                      //Navigator.pop(context);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const <Widget>[
                        Expanded(
                          flex: 1,
                          child: Text(
                            '       Ok',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 5,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
        )
      ],
    );
  }
}
