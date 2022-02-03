import 'package:flutter/material.dart';
import 'package:revio/ui/aboutScreen.dart';
import 'package:revio/ui/auth/loginpage.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/ui/songs/playScreen.dart';
import 'package:revio/ui/songs/song_item.dart';

class AlbumScreen extends StatelessWidget {
  //Is also playlist screen
  final String _title;

  AlbumScreen({Key? key, required String title})
      : _title = title,
        super(key: key);

  final SongRepo _songRepo = SongRepo();

  List<Song> _songs = [];

  List<Song> _handleSongLists(Song song) {
    final index = _songs.indexWhere((element) => element.id == song.id);
    if (index == -1) {
      //uhh new song
      _songs.add(song);
    } else {
      //replace song content
      _songs[index] = song;
    }
    return _songs;
  }

  Stream<List<Song>> getSongs() {
    return _songRepo.getAllSongs().map((song) => _handleSongLists(song));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        iconTheme: const IconThemeData(color: Color(0xFFC2C2C2)),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF222222),
        title: Text(_title,
            style: const TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF555555),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/images/$_title.png',
                          ),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'Collection of Songs', //Should it be hardcoded?
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                      Text(
                        '42 min', //Should it be hardcoded?
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          StreamBuilder<List<Song>>(
            stream: getSongs(),
            builder: (context, snapshot) {
              print(snapshot.hasData);
              if (snapshot.hasData) {
                return Flexible(
                    child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              child: SongItem(song: snapshot.data![index]),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => PlayScreen(
                                            song: snapshot.data![index]))));
                              });
                        }));
              }
              return Expanded(child: Text("nothing to show here"));
            },
          )
        ],
      ),
    );
  }
}
