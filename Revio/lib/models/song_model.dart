import 'package:flutter/cupertino.dart';

import '../service/song/song_service.dart';

class Song extends ChangeNotifier {
  final SongService _songService;

  Song({required SongService songService}) : _songService = songService;

  String _name = "";
  String _artist = "";
  String _description = "";
  String _features = "";
  String _path = "";

  String get name {
    return _name;
  }

  String get artist {
    return _artist;
  }

  String get description {
    return _description;
  }

  String get features {
    return _features;
  }

  String get path {
    return _path;
  }

  set name(String name) {
    _name = name;
  }

  set artist(String artist) {
    _artist = artist;
  }

  set description(String description) {
    _description = description;
  }

  set features(String features) {
    _features = features;
  }

  set path(String path) {
    _path = path;
  }

  void addSong() async {
    print(this);
    _songService.CreateSong(_name, _artist, _description, _features, _path);
    notifyListeners();
  }
}
