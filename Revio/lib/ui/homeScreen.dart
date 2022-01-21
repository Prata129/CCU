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
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 40, top: 60.0),
                  child: Row(children: [
                    Container(
                      //margin: const EdgeInsets.only(top: 60, bottom: 30),
                      height: 158,
                      width: 305,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(214, 196, 196, 196),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                        onPressed: () {},
                        //allignment: Algnment.topRight
                        child: Text('Crypto Stats',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ])),
            ],
          ),
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

                  /* Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                              width: 140,
                              height: 140,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/playlist1.png',
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
                                        'Playlist 1',
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
                */
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

  Widget _myListView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('row $index'),
        );
      },
    );
  }
}
