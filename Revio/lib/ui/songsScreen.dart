import 'package:flutter/material.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/ui/songs/song_item.dart';

class SongsPage extends StatelessWidget {
  SongsPage({Key? key}) : super(key: key);
  
  final SongRepo _songRepo = SongRepo();

  List<Song> _songs = [];
  
  List<Song> _handleSongLists(Song song) {
    _songs.add(song); //yolo

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
                return Flexible(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return SongItem(song: snapshot.data![index]);
                    }
                  )
                );
              },
            )
          ],
        )
    );
  }
}