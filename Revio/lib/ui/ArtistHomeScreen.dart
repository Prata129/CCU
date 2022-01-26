// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revio/ui/settingsScreen.dart';
import 'package:revio/ui/myMusic.dart';
import 'package:revio/ui/myFans.dart';
import 'package:revio/data/user_repo.dart';
import 'package:revio/models/user_model.dart';

class ArtistHomeScreen extends StatefulWidget {
  @override
  _ArtistHomeScreen createState() => _ArtistHomeScreen();
}

class _ArtistHomeScreen extends State<ArtistHomeScreen> {
  final UserRepo _userRepo = UserRepo();
  double _money = 00.00;

  double getUserMoney() {
    _userRepo.getUser().then((User user) {
      setState(() {
        _money = user.money;
      });
    });
    return _money;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(children: [
//**************WELCOME BACK AND SSETTINGS********************

          Padding(
            padding: const EdgeInsets.only(left: 15, top: 35.0),
            child: Row(children: [
              /* Align(
                alignment: const AlignmentDirectional(0.7, -0.8),
                child:  */
              Container(
                child: Text('Welcome Back, Zé',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFFC2C2C2),
                      fontSize: 32,
                    )),
              ),
              //),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.9, -0.8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                    },
                    radius: 30,
                    //padding: const EdgeInsets.only(top: 60.0),
                    child: Container(
                        //margin: const EdgeInsets.only(bottom: 40, left: 50),
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/images/settings.png')),
                  ),
                ),
              ),
            ]),
          ),

//**************CRYPTO STATS********************

          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 291,
                height: 133,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(214, 196, 196, 196),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '  Stats',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '    My Crypto Earnings:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        )
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                ' ${getUserMoney()}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 48,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            /*  Expanded(
                              flex: 1,
                              child: Text(
                                ' .${getUserMoney() % 1}',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ), */
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.centerLeft,
                                    image: AssetImage(
                                      'assets/images/cryptoCoin.png',
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ]),
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            ' ${getUserMoney() * 7 + 38}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomLeft,
                                image: AssetImage(
                                  'assets/images/euro.png',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            )
          ]),

//**************MY MUSIC********************

          Row(children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 256,
                height: 56,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 58, 169, 206),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyMusic()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                'assets/images/musicNote.png',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'My Music',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                'assets/images/musicNote.png',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),

//**************MY FANS********************

          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 256,
                height: 56,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 83, 157, 109),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyFans()));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                'assets/images/manDancing.png',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          '  My Fans',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.contain,
                              image: AssetImage(
                                'assets/images/womanDancing.png',
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),

//**************FROM REVIO TO YOU********************

          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(children: [
              Container(
                child: Text('From Revio to you',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                //margin: const EdgeInsets.only(top: 60, bottom: 30),
                height: 146,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(213, 134, 134, 134),
                ),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: SizedBox(
                            width: 140,
                            height: 140,
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/adele25.jpg',
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
                                      'Artists',
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
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 40.0),
            child: Row(children: [
              Container(
                child: Text('Latest Arrivals',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                //margin: const EdgeInsets.only(top: 60, bottom: 30),
                height: 146,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(213, 134, 134, 134),
                ),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: SizedBox(
                            width: 140,
                            height: 140,
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/adele25.jpg',
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
                                      'Artists',
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
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
