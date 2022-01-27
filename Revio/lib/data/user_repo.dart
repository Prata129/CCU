import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:revio/models/artist_model.dart';
import 'package:revio/models/user_model.dart' as Model;

//CAN BE REFACTORED IN THE FUTURE NOT IN THE MOOD RN

class UserRepo {
  final CollectionReference _ref =
      FirebaseFirestore.instance.collection('user');

  Future<DocumentReference> saveUser(Model.User user) async {
    return await _ref.add(user.toMap());
  }

  Future<Model.User> getUser() async {
    final snapshot = await _ref
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();

    final doc = snapshot.docs[0]; //bad idea?
    return Model.User(
      id: doc.id,
      email: doc['email'],
      displayName: doc['displayName'],
      isArtist: doc['isArtist'],
      avatarUrl: doc['avatarUrl'],
      money: doc['money'],
      genre: doc['genre'],
    );
  }

  Future<CollectionReference<Map<String, dynamic>>>
      getArtistsSubCollection() async {
    final snapshot = await _ref
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();

    final doc = snapshot.docs[0];

    return _ref.doc(doc.id).collection('artistas');
  }

  void incrementTimesListened(String artistName) async {
    getArtistsSubCollection().then((subCollection) => subCollection
        .doc(artistName)
        .update({'timesListened': FieldValue.increment(1)}));
  }

  Future<DocumentReference> addArtist(Artist artist) async {
    return await getArtistsSubCollection()
        .then((subCollection) => subCollection.add(artist.toMap()));
  }

  Stream<Artist> getFanArtists() async* {
    final snapshot = await _ref
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();

    final doc = snapshot.docs[0];

    final subcollection = _ref.doc(doc.id).collection('artistas').snapshots();

    await for (final snapshots in subcollection) {
      for (final changes in snapshots.docChanges) {
        yield Artist(
            id: changes.doc.id,
            name: changes.doc["name"],
            level: changes.doc["level"],
            timesListened: changes.doc["timesListened"]);
      }
    }
  }

  Stream<Model.User> getGenreArtists(String genre) async* {
    final snapshot = await _ref.where('genre', isEqualTo: genre).get();

    final doc = snapshot.docs[0];

    final subcollection =
        _ref.doc(doc.id).collection('generoArtistas').snapshots();

    await for (final snapshots in subcollection) {
      for (final changes in snapshots.docChanges) {
        yield Model.User(
          id: changes.doc.id,
          email: changes.doc["email"],
          displayName: changes.doc["nome"],
          isArtist: changes.doc["isArtist"],
          avatarUrl: changes.doc["avatarUrl"],
          money: changes.doc["money"],
          genre: changes.doc["genre"],
        );
      }
    }
  }
}
