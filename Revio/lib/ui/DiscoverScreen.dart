import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revio/ui/genreArtist_item.dart';
import 'package:revio/models/user_model.dart';
import 'package:revio/data/user_repo.dart';

// ignore: constant_identifier_names
const double SQUARE_SIZE = 158;

class DiscoverScreen extends StatelessWidget {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF222222),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                iconTheme: IconThemeData(color: const Color(0xFFC2C2C2)),
                backgroundColor: Color(0xFF222222),
                title: const Text("Discover",
                    style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
                elevation: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 20),
                            child: SizedBox(
                                width: SQUARE_SIZE,
                                height: SQUARE_SIZE,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenreArtists(genre: 'Pop')));
                                    },
                                    child: Stack(children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/images/pop.png',
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
                                              colors: [
                                                Colors.black.withOpacity(0),
                                                Colors.black,
                                              ],
                                              stops: const [
                                                0,
                                                1
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        child: const Align(
                                          alignment: Alignment
                                              .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              'Pop',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 40, bottom: 20),
                            child: SizedBox(
                                width: SQUARE_SIZE,
                                height: SQUARE_SIZE,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenreArtists(genre: 'EDM')));
                                    },
                                    child: Stack(children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/images/EDM.png',
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
                                              colors: [
                                                Colors.black.withOpacity(0),
                                                Colors.black,
                                              ],
                                              stops: const [
                                                0,
                                                1
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        child: const Align(
                                          alignment: Alignment
                                              .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              'EDM',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                            width: SQUARE_SIZE,
                            height: SQUARE_SIZE,
                            child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GenreArtists(genre: 'Rock')));
                                },
                                child: Stack(children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          'assets/images/rock.png',
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: FractionalOffset.topCenter,
                                          end: FractionalOffset.bottomCenter,
                                          colors: [
                                            Colors.black.withOpacity(0),
                                            Colors.black,
                                          ],
                                          stops: const [
                                            0,
                                            1
                                          ]),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    child: const Align(
                                      alignment: Alignment
                                          .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                      child: Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          'Rock',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ]))),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                                width: SQUARE_SIZE,
                                height: SQUARE_SIZE,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenreArtists(genre: 'Fado')));
                                    },
                                    child: Stack(children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/images/fado.png',
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
                                              colors: [
                                                Colors.black.withOpacity(0),
                                                Colors.black,
                                              ],
                                              stops: const [
                                                0,
                                                1
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        child: const Align(
                                          alignment: Alignment
                                              .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              'Fado',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                                width: SQUARE_SIZE,
                                height: SQUARE_SIZE,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenreArtists(genre: 'Funk')));
                                    },
                                    child: Stack(children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/images/funk.png',
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
                                              colors: [
                                                Colors.black.withOpacity(0),
                                                Colors.black,
                                              ],
                                              stops: const [
                                                0,
                                                1
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        child: const Align(
                                          alignment: Alignment
                                              .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              'Funk',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                                width: SQUARE_SIZE,
                                height: SQUARE_SIZE,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenreArtists(
                                                      genre: 'House')));
                                    },
                                    child: Stack(children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/images/house.png',
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
                                              colors: [
                                                Colors.black.withOpacity(0),
                                                Colors.black,
                                              ],
                                              stops: const [
                                                0,
                                                1
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        child: const Align(
                                          alignment: Alignment
                                              .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              'House',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                                width: SQUARE_SIZE,
                                height: SQUARE_SIZE,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenreArtists(
                                                      genre: 'Kizomba')));
                                    },
                                    child: Stack(children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/images/kizomba.png',
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
                                              colors: [
                                                Colors.black.withOpacity(0),
                                                Colors.black,
                                              ],
                                              stops: const [
                                                0,
                                                1
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        child: const Align(
                                          alignment: Alignment
                                              .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              'Kizomba',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: SizedBox(
                                width: SQUARE_SIZE,
                                height: SQUARE_SIZE,
                                child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GenreArtists(
                                                      genre: 'World Music')));
                                    },
                                    child: Stack(children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/images/WorldMusic.png',
                                            ),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                              begin: FractionalOffset.topCenter,
                                              end:
                                                  FractionalOffset.bottomCenter,
                                              colors: [
                                                Colors.black.withOpacity(0),
                                                Colors.black,
                                              ],
                                              stops: const [
                                                0,
                                                1
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      Container(
                                        child: const Align(
                                          alignment: Alignment
                                              .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                          child: Padding(
                                            padding: EdgeInsets.all(5),
                                            child: Text(
                                              'World Music',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class GenreArtists extends StatelessWidget {
  PageController pageController = PageController();
  String _genre;
  GenreArtists({required String genre}) : _genre = genre;

  List<User> _artists = [];
  final UserRepo _userRepo = UserRepo();

  List<User> _handleGenreArtistLists(User artist) {
    final index = _artists.indexWhere((element) => element.id == artist.id);
    if (index == -1) {
      //uhh new artist
      _artists.add(artist);
    } else {
      //replace artist content
      _artists[index] = artist;
    }

    _artists.sort((a, b) => b.displayName.compareTo(a.displayName));
    return _artists;
  }

  Stream<List<User>> getUserArtists() {
    return _userRepo
        .getGenreArtists(_genre)
        .map((update) => _handleGenreArtistLists(update));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF222222),
        body: Column(children: [
          AppBar(
            leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                }),
            iconTheme: IconThemeData(color: const Color(0xFFC2C2C2)),
            backgroundColor: Color(0xFF222222),
            title: Text("${_genre} Artists",
                style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
            elevation: 0,
          ),
          StreamBuilder<List<User>>(
              stream: getUserArtists(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GenreArtistItem(artist: snapshot.data![index]);
                      },
                    ),
                  );
                }
                return Expanded(
                    child: Center(child: Text("Go Listen to some artists.")));
              })
        ]));
  }
}
