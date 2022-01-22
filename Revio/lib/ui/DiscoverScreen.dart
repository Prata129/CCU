import 'package:flutter/material.dart';

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
                      Padding(
                        padding: const EdgeInsets.only(top: 40, bottom: 20),
                        child: SizedBox(
                            width: SQUARE_SIZE,
                            height: SQUARE_SIZE,
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/pop.png',
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
                                      'New Popular',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )
                            ])),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE,
                              height: SQUARE_SIZE,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/EDM.png',
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
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE,
                              height: SQUARE_SIZE,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/fado.png',
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
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/funk.png',
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
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE,
                              height: SQUARE_SIZE,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/house.png',
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
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/kizomba.png',
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
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE,
                              height: SQUARE_SIZE,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/WorldMusic.png',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: SingleChildScrollView(
          child: Column(children: [
        AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios), onPressed: () {}),
          iconTheme: IconThemeData(color: const Color(0xFFC2C2C2)),
          backgroundColor: Color(0xFF222222),
          title: Text("${_genre} Artists",
              style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
          elevation: 0,
        ),
      ])),
    );
  }
}
