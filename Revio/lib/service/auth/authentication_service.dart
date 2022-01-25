import 'package:firebase_auth/firebase_auth.dart';
import 'package:revio/service/auth/authentication_state.dart';
import 'package:revio/service/user/user_creation_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  final UserCreationService _userCreationService;

  AuthenticationService(this._firebaseAuth, this._userCreationService);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  
  Future<String> getUID() async {
    return _firebaseAuth.currentUser!.uid;
  }
  Future getCurrentUser() async {
    return _firebaseAuth.currentUser!;
  }
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<AuthState?> signIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
            email: email,
            password: password
          );
      return AuthState(AuthStatus.authed, '');
    } on FirebaseAuthException catch (e) {
      return AuthState(AuthStatus.error, e.message);
    }
  }
  
  Future<AuthState?> signUp({required String email, required String password, required String displayName, required bool? isArtist}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
      
      _userCreationService.CreateUser(email, displayName, isArtist);
      return AuthState(AuthStatus.authed, '');
    } on FirebaseAuthException catch (e) {
      return AuthState(AuthStatus.error, e.message);
    }
  }
}