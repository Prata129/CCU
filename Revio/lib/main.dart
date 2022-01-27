import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:revio/data/user_repo.dart';
import 'package:revio/service/song/song_service.dart';
import 'package:revio/service/user/user_creation_service.dart';
import 'package:revio/ui/ArtistHomeScreen.dart';
import 'package:revio/ui/auth/login_model.dart';
import 'package:revio/ui/auth/signup_model.dart';
import 'package:revio/ui/auth/loginpage.dart';
import 'package:revio/service/auth/authentication_service.dart';
import 'package:revio/ui/homeScreen.dart';
import 'package:revio/ui/homepage.dart';
import 'package:revio/ui/profile/profile_view.dart';
import 'package:revio/ui/settingsScreen.dart';
import 'package:revio/ui/LibraryScreen.dart';
import 'package:revio/ui/aboutScreen.dart';
import 'package:revio/ui/artist/addSongScreen.dart';
import 'package:revio/ui/eventsHomePage.dart';
import 'package:revio/ui/artistsYouLoveEvents.dart';
import 'package:revio/ui/nosAliveEvent.dart';
import 'package:revio/ui/songsScreen.dart';

import 'data/song_repo.dart';
import 'models/song_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final authService = AuthenticationService(
        FirebaseAuth.instance, UserCreationService(UserRepo()));

    final songService = SongService(SongRepo());

    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(create: (_) => authService),
        Provider<SongService>(create: (_) => songService),
        ChangeNotifierProvider<Song>(
            create: (_) => Song(songService: songService)),
        ChangeNotifierProvider<LoginModel>(
            create: (_) => LoginModel(authService: authService)),
        ChangeNotifierProvider<SignUpModel>(
            create: (_) => SignUpModel(authService: authService)),
        StreamProvider(
          create: (context) => authService.authStateChanges,
          initialData: null,
        )
      ],
      child: MaterialApp(
        title: 'RevioDemo',
        routes: {
          "/login": (_) => new LoginPage(),
        },
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return ProfileView();
    }
    return const LoginPage();
  }
}
