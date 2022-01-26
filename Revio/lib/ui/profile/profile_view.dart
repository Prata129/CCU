import 'package:flutter/material.dart';
import 'package:revio/models/artist_model.dart';
import 'package:revio/models/user_model.dart';
import 'package:revio/ui/profile/artist_item.dart';
import 'package:revio/ui/profile/avatar.dart';
import 'package:revio/data/user_repo.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  List<Artist> _artists = [];
  final UserRepo _userRepo = UserRepo();
  String _displayName = "Hello";
  List<Image> images = [
    Image.asset("assets/images/playlist1.png"),
    Image.asset("assets/images/playlist2.png"),
    Image.asset("assets/images/playlist3.png"),
  ];

  List<Artist> _handleArtistLists(Artist artist) {
    final index = _artists.indexWhere((element) => element.id == artist.id);
    if (index == -1) {
      //uhh new artist
      _artists.add(artist);
    } else {
      //replace artist content
      _artists[index] = artist;
    }

    //kinda sort by level
    _artists.sort((a, b) => b.level.compareTo(a.level));
    return _artists;
  }

  String getUsername() {
    _userRepo.getUser().then((User user) {
      setState(() {
        _displayName = user.displayName;
      });
    });
    return _displayName;
  }

  Stream<List<Artist>> getUserArtists() {
    return _userRepo
        .getFanArtists()
        .map((update) => _handleArtistLists(update));
  }

  Widget myImage(int index) {
    int number = index + 1;
    return Stack(children: <Widget>[
      Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(image: images[index].image, fit: BoxFit.cover),
        ),
      ),
      Center(
          child: Padding(
              padding: EdgeInsets.only(top: 115, left: 40),
              child: Text(
                "Playlist $number",
                style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF222222),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Color(0xFFC2C2C2)),
          backgroundColor: const Color(0xFF222222),
          title: Text(getUsername(),
              style: const TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 40, right: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const <Widget>[
                      CircleAvatar(
                        radius: 65.0,
                        backgroundColor: Color(0xFFE5E5E5),
                        child: CircleAvatar(
                          radius: 63.0,
                          backgroundImage:
                              AssetImage('assets/images/adele25.jpg'),
                        ),
                      )
                      //Avatar(
                      // avatarUrl: currentUser.avatarUrl,
                      //  onTap: () {
                      //TODO TAP TO CHANGE PHOTO
                      //})
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20, right: 250, bottom: 10),
                child: Text('Playlists',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w400)),
              ),
              SizedBox(
                height: 200.0,
                child: new ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 20,
                  );
                },
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return myImage(index);
                },
                scrollDirection: Axis.horizontal,
                )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "Favorite Artists",
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
              ),
              StreamBuilder<List<Artist>>(
                  stream: getUserArtists(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ArtistItem(artist: snapshot.data![index]);
                          },
                      );
                    }
                    return Expanded(
                        child:
                            Center(child: Text("Go Listen to some artists.")));
                  })
              ]
          )
        )
    );
  }
}
