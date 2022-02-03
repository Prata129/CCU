import 'dart:ffi';

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
    if (doc['isArtist']) {
      return Model.User(
        id: doc.id,
        email: doc['email'],
        displayName: doc['displayName'],
        isArtist: doc['isArtist'],
        avatarUrl: doc['avatarUrl'],
        genre: doc['genre'],
      );
    } else {
      return Model.User(
        id: doc.id,
        email: doc['email'],
        displayName: doc['displayName'],
        isArtist: doc['isArtist'],
        avatarUrl: doc['avatarUrl']
      );
    }

  }

  Future<CollectionReference<Map<String, dynamic>>>
      getArtistsSubCollection() async {
    final snapshot = await _ref
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();

    final doc = snapshot.docs[0];

    return _ref.doc(doc.id).collection('artistas');
  }
  bool isCollectionEmpty() {
    bool val = false;
      getArtistsSubCollection().then((subCollection) => {
      subCollection.limit(1).get().then(
        (value) => {
          val = value.size > 0
        }
        )
      }
    );
    return val;
  }

  Future<bool> isArtist() async {
    bool val = false;
    Future<Model.User> currentUser = getUser();
    currentUser.then((value) => val = value.isArtist);
    return val;
  }
  Future<DocumentReference> addNewArtist(Artist artist) async {
    return await getArtistsSubCollection()
        .then((subCollection) => subCollection.add(artist.toMap()));
  }
  Future<bool> checkIfDocExists(String docId) async {
      // Get reference to Firestore collection
      var collectionRef = await getArtistsSubCollection();

      var doc = await collectionRef.where('name', isEqualTo: docId).get();
      
      return doc.size > 0;
    
  }

  void addArtist(String artistName) async {
    bool val = await checkIfDocExists(artistName);
    if (val) {
      var collectionRef = await getArtistsSubCollection();
      var doc = await collectionRef.where('name', isEqualTo: artistName).get();
      var docId = doc.docs[0].id;
      getArtistsSubCollection().then((subCollection) => subCollection
        .doc(docId)
        .update({'times_listened': FieldValue.increment(1)}));
    } else {
        addNewArtist(Artist(
        id: '',
        name: artistName,
        level: 0,
        timesListened: 0,
      ));
    }
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
            timesListened: changes.doc["times_listened"]);
      }
    }
  }

  Stream<Model.User> getGenreArtists(String genre) async* {
    final snapshot = await _ref.where('genre', isEqualTo: genre).get();

    final doc = snapshot.docs[0];

    for (final changes in snapshot.docChanges) {
      yield Model.User(
        id: changes.doc.id,
        email: changes.doc["email"],
        displayName: changes.doc["displayName"],
        isArtist: changes.doc["isArtist"],
        avatarUrl: changes.doc["avatarUrl"],
        genre: changes.doc["genre"],
      );
    }
  }
}
