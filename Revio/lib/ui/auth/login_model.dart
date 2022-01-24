import 'package:flutter/cupertino.dart';
import 'package:revio/service/auth/authentication_service.dart';
import 'package:revio/service/auth/authentication_state.dart';

class LoginModel extends ChangeNotifier {
  final AuthenticationService _authService;

  LoginModel({required AuthenticationService authService}) : _authService = authService;

  String _email = "";
  String _password = "";
  AuthState? _state;

  AuthState? get state {
    return _state;
  }
  
  void resetState() {
    _state = AuthState(AuthStatus.unuathed, null);
  }
  
  set email(String email) {
    this._email = email;
  }

  set password(String password) {
    this._password = password;
  }

  void loginUser() async {
    this._state = await _authService.signIn(email: _email, password: _password);

    if (this._state!.authStatus == AuthStatus.authed) {
      _email = "";
      _password = "";
    }

    notifyListeners();
  }
}