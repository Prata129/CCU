// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';
import 'package:revio/ui/artistHomeScreen.dart';
import 'package:revio/ui/song_item.dart';
import 'package:revio/ui/artist/addSongScreen.dart';
import 'package:revio/ui/addSongPlaylistScreen.dart';

import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';

class MyMusic extends StatelessWidget {
  PageController pageController = PageController();
  String _artist;
  MyMusic({required String artist}) : _artist = artist;

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
          title: Text("My Music",
              style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
          elevation: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(children: [
            /* Align(
                alignment: const AlignmentDirectional(0.7, -0.8),
                child:  */
            Container(
              child: Text('A Playlist For You',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
          ]),
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
                            .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
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
          child: Container(
            width: 90,
            height: 30,
            //color: Color.fromARGB(255, 58, 169, 206),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 189, 88),
                borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddSongPlaylist(artist: _artist)));
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const <Widget>[
                  Expanded(
                    flex: 1,
                    child: Text(
                      '  Submit a Song',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Row(children: <Widget>[
            Expanded(
              flex: 4,
              child: Text(
                'Your Songs',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: 63,
                height: 17,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 189, 88),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddSongScreen()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          '    Add Music',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                          return SongItem(song: snapshot.data![index]);
                        },
                      ),
                    );
                  }
                  return Center(child: Text("You have no songs added"));
                })),
      ]),
      //),
    );
  }
}


//**************Add Music********************

        /* Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 256,
                height: 56,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 189, 88),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          '     Add Music',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]), */



//*************wheel scroll*************** */

          /*ListWheelScrollViewX.useDelegate(
                useMagnifier: true,
                physics: ScrollPhysics(),
                magnification: 1,
                offAxisFraction: -2,
                overAndUnderCenterOpacity: 0.5,
                scrollDirection: Axis.horizontal,
                diameterRatio: 0.7,
                itemExtent: 100,
                clipBehavior: Clip.none,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      //color: Color.fromARGB(255, 58, 169, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 229, 189, 88),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      //color: Color.fromARGB(255, 58, 169, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 88, 229, 100),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArtistHomeScreen()));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              'assets/images/adele25.jpg',
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      //color: Color.fromARGB(255, 58, 169, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 229, 88, 118),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      //color: Color.fromARGB(255, 58, 169, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 88, 217, 229),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ],
                )),*/ 