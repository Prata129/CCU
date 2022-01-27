import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:revio/service/auth/authentication_service.dart';
import 'package:revio/service/auth/authentication_state.dart';

class SignUpModel extends ChangeNotifier {
  final AuthenticationService _authService;

  SignUpModel({required AuthenticationService authService})
      : _authService = authService;

  String _email = "";
  String _password = "";
  String _confirmedPassword = "";
  String _displayName = "";
  bool? _isArtist = false;
  String? _genre;
  AuthState? _state;

  AuthState? get state {
    return _state;
  }

  void resetState() {
    _state = AuthState(AuthStatus.unuathed, null);
  }

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

  String? get genre {
    return _genre;
  }

  String get confirmedPassword {
    return _confirmedPassword;
  }

  String get displayName {
    return _displayName;
  }

  bool? get isArtist {
    return _isArtist;
  }

  String validateEmail(String email) {
    _email = email;
    if (EmailValidator.validate(email)) {
      return "Valid";
    }

    return "Please enter a valid email.";
  }

  String validatePassword(String password) {
    _password = password;
    if (password.length > 5) {
      return "Valid";
    }
    return "Password must be at least 6 characters long.";
  }

  void validateArtist(bool? value) {
    this._isArtist = value;
  }

  void validateGenre(String? value) {
    _genre = value;
  }

  String validadeUsername(String username) {
    _displayName = username;
    return "Username Available";
  }

  String validatePasswordMatch(String confirmedPassword) {
    _confirmedPassword = confirmedPassword;
    if (this._password == confirmedPassword) {
      return "Valid";
    }
    return "Passwords must match.";
  }

  void registerUser() async {
    if (!EmailValidator.validate(email)) {
      this._state = AuthState(AuthStatus.error, "Please enter a valid email.");
      notifyListeners();
      return;
    }

    if (password != confirmedPassword) {
      this._state = AuthState(AuthStatus.error, "Passwords need to match.");
      notifyListeners();
      return;
    }

    this._state = AuthState(AuthStatus.loading, null);
    notifyListeners();

    this._state = await _authService.signUp(
        email: _email,
        password: _password,
        displayName: _displayName,
        isArtist: _isArtist,
        genre: _genre);

    if (this._state!.authStatus == AuthStatus.authed) {
      _email = "";
      _password = "";
      _confirmedPassword = "";
    }

    notifyListeners();
  }
}
