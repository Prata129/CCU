import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revio/data/user_repo.dart';
import 'package:revio/models/user_model.dart';

class UserCreationService {
  final UserRepo _userRepo;

  UserCreationService(this._userRepo);

  void CreateUser(String email, String displayName, bool? isArtist) async {
    await _userRepo.saveUser(
      User(
        id: '',
        email: email,
        displayName: displayName,
        isArtist: isArtist,
        avatarUrl: '',
        money: 50.55,
      ),
    );
  }
}
