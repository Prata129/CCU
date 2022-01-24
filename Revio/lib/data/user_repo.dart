import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
      displayName: doc['username'],
      isArtist: doc['isArtist'],
      avatarUrl: doc['avatarUrl']
    );
  }
}