import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:revio/models/song_model.dart' as Model;

class SongRepo {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('songs');

  Future<DocumentReference> saveSong(Map<String, dynamic> map) async {
    return await _ref.add(map);
  }

  Future<Map<String, dynamic>> getSong(String name) async {
    final snapshot = await _ref.where('name', isEqualTo: name).get();

    final doc = snapshot.docs[0];
    return {
      'name': doc['name'],
      'artist': doc['artist'],
      'description': doc['description'],
      'features': doc['features'],
      'path': doc['path']
    };
  }
}
