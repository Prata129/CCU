// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';
import 'package:revio/ui/artistHomeScreen.dart';
import 'package:revio/ui/songPlaylist_item.dart';
import 'package:revio/ui/song_item.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';

class AddSongPlaylist extends StatelessWidget {
  PageController pageController = PageController();
  String _artist;
  int index = 0;
  AddSongPlaylist({required String artist}) : _artist = artist;

  List<Song> _songs = [];
  final SongRepo _songRepo = SongRepo();

  List<Song> _handleSongLists(Song song) {
    final index = _songs.indexWhere((element) => element.id == song.id);
    if (index == -1) {
      //uhh new artist
      _songs.add(song);
    } else {
      //replace artist content
      _songs[index] = song;
    }

    _songs.sort((a, b) => b.name.compareTo(a.name));
    return _songs;
  }

  Stream<List<Song>> getArtistSongs() {
    return _songRepo.getAllSongs().map((update) => _handleSongLists(update));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: //SingleChildScrollView(
          Column(children: [
        AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
          backgroundColor: Color(0xFF222222),
          title: Text("Revio's Picks",
              style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
          elevation: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: SizedBox(
                  width: 182,
                  height: 240,
                  child: Stack(children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.scaleDown,
                          image: AssetImage(
                            'assets/images/our_top_picks.png',
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
                              //Colors.black,
                            ],
                            stops: const [
                              0,
                              1
                            ]),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ), */
                    Container(
                      child: const Align(
                        alignment: Alignment
                            .center, // Align however you like (i.e .centerRight, centerLeft)
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Revio's Picks",
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
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  'Choose a song to submit!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),

                /* Expanded(flex: 2,
            child: Container()),
          Expanded(), */
              ]),
        ),
        Container(
            //margin: const EdgeInsets.only(top: 60, bottom: 30),
            height: 146,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(213, 134, 134, 134),
            ),
            child: StreamBuilder<List<Song>>(
                stream: getArtistSongs(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Flexible(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return SongPlaylistItem(
                              song: snapshot.data![index], index: index++);
                        },
                      ),
                    );
                  }
                  return Flexible(
                      child: Center(child: Text("You have no songs added")));
                })),
      ]),
      //),
    );
  }
}
