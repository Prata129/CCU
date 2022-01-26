// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revio/ui/settingsScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Row(children: [
              /* Align(
                alignment: const AlignmentDirectional(0.7, -0.8),
                child:  */
              Container(
                child: Text('Welcome Back, Zé',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
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
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                                ' 563',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 48,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '.54',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
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
                            ' 153.73',
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
