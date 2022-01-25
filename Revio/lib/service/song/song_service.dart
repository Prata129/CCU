import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/models/song_model.dart';

class SongService {
  final SongRepo _songRepo;

  SongService(this._songRepo);

  void CreateSong(
      String name, String description, String features, String path) async {
    await _songRepo.saveSong(
      Song(
          name: name, description: description, features: features, path: path),
    );
  }
}
