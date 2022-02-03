import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:revio/data/user_repo.dart';
import 'package:revio/models/artist_model.dart';
import 'package:revio/models/user_model.dart';

class UserCreationService {
  final UserRepo _userRepo;

  UserCreationService(this._userRepo);

  void CreateUser(
      String email, String displayName, bool isArtist, String? genre) async {
    await _userRepo.saveUser(
      User(
        id: '',
        email: email,
        displayName: displayName,
        isArtist: isArtist,
        avatarUrl: '',
        genre: genre,
      ),
    );
  }
}
