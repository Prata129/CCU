import 'package:flutter/material.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/ui/songs/playScreen.dart';
import 'package:revio/ui/songs/song_item.dart';

class MySongsPage extends StatelessWidget {
  MySongsPage({Key? key}) : super(key: key);

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
          iconTheme: IconThemeData(color: const Color(0xFFC2C2C2)),
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF222222),
          title: Text("My Songs",
              style: const TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
          elevation: 0,
        ),
        body: Column(
          children: [
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
        ));
  }
}
