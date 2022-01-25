import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:revio/models/song_model.dart' as Model;

class SongRepo {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('songs');

  Future<DocumentReference> saveSong(Model.Song song) async {
    return await _ref.add(song.toMap());
  }

  Future<Model.Song> getSong(String name) async {
    final snapshot = await _ref.where('name', isEqualTo: name).get();

    final doc = snapshot.docs[0];
    return Model.Song(
        name: doc['name'],
        description: doc['description'],
        features: doc['features'],
        path: doc['path']);
  }
}
