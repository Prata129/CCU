import 'package:flutter/material.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/ui/songs/song_item.dart';

class SongsPage extends StatelessWidget {
  SongsPage({Key? key}) : super(key: key);
  
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
      backgroundColor: Color(0xFF222222),
      body: Column(
          children: [
            StreamBuilder<List<Song>>(
              stream: getSongs(),
              builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Flexible(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return SongItem(song: snapshot.data![index]);
                    }
                  )
                );
              }
              return Expanded(child: Text("nothing to show here"));
              },
            )
          ],
        )
    );
  }
}