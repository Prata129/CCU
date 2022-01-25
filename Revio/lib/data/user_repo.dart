import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:revio/models/artist_model.dart';
import 'package:revio/models/user_model.dart' as Model;

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
      avatarUrl: doc['avatarUrl']
    );
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
            name: changes.doc["nome"],
            level: changes.doc["nivel"],
            timesListened: changes.doc["timesListened"]
          );
        }
      }
  }
}