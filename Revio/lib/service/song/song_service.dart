import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/models/song_model.dart';

class SongService {
  final SongRepo _songRepo;

  SongService(this._songRepo);

  Map<String, dynamic> toMap(String name, String artist, String description,
      String features, String path) {
    return {
      'name': name,
      'artist': artist,
      'description': description,
      'features': features,
      'path': path,
      'inPlaylist': false,
    };
  }

  void CreateSong(String name, String artist, String description,
      String features, String path) async {
    await _songRepo.saveSong(toMap(name, artist, description, features, path));
  }
}
