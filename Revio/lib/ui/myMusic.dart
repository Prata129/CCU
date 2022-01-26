// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_wheel_scroll_view_x/list_wheel_scroll_view_x.dart';
import 'package:revio/ui/artistHomeScreen.dart';
import 'package:revio/ui/artist/addSongScreen.dart';

class MyMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: //SingleChildScrollView(
          Column(children: [
        AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
          backgroundColor: Color(0xFF222222),
          title: Text("My Music",
              style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
          elevation: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(children: [
            /* Align(
                alignment: const AlignmentDirectional(0.7, -0.8),
                child:  */
            Container(
              child: Text('Playlists For You',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            height: 140,
            child: ListWheelScrollViewX.useDelegate(
                useMagnifier: true,
                physics: ScrollPhysics(),
                magnification: 1,
                offAxisFraction: -2,
                overAndUnderCenterOpacity: 0.5,
                scrollDirection: Axis.horizontal,
                diameterRatio: 0.7,
                itemExtent: 100,
                clipBehavior: Clip.none,
                childDelegate: ListWheelChildLoopingListDelegate(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      //color: Color.fromARGB(255, 58, 169, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 229, 189, 88),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      //color: Color.fromARGB(255, 58, 169, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 88, 229, 100),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ArtistHomeScreen()));
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              'assets/images/adele25.jpg',
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      //color: Color.fromARGB(255, 58, 169, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 229, 88, 118),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      //color: Color.fromARGB(255, 58, 169, 206),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 88, 217, 229),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ],
                )),
          ),
        ),
        Container(
          child: Text('Tap to submit songs\nto this playlist',
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(
                color: Color.fromARGB(174, 255, 255, 255),
                fontSize: 15,
              )),
        ),
        Row(children: <Widget>[
          Expanded(
            flex: 4,
            child: Text(
              'Your Songs',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 63,
              height: 17,
              //color: Color.fromARGB(255, 58, 169, 206),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 229, 189, 88),
                  borderRadius: BorderRadius.circular(10)),
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddSongScreen()));
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        '    Add Music',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /* Expanded(flex: 2,
            child: Container()),
          Expanded(), */
        ]),
        Container(
          //margin: const EdgeInsets.only(top: 60, bottom: 30),
          height: 146,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Color.fromARGB(213, 134, 134, 134),
          ),
          child: ListView(scrollDirection: Axis.horizontal, children: [
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
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
                              fit: BoxFit.scaleDown,
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
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
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
                              fit: BoxFit.scaleDown,
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
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
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
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
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
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
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
                ),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
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
                ),
              ],
            ),
          ]),
        ),
      ]),
      //),
    );
  }
}


//**************Add Music********************

        /* Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 256,
                height: 56,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 229, 189, 88),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          '     Add Music',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]), */