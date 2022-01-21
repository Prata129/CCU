import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const double SQUARE_SIZE = 158;

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF222222),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                leading: IconButton(
                    icon: const Icon(Icons.arrow_back_ios), onPressed: () {}),
                iconTheme: IconThemeData(color: const Color(0xFFC2C2C2)),
                backgroundColor: Color(0xFF222222),
                title: const Text("Library",
                    style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
                elevation: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                          width: 340,
                          height: 70,
                          child: Stack(children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/crowd.png',
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
                                      Colors.black.withOpacity(0.3),
                                      Colors.black,
                                    ],
                                    stops: const [
                                      0,
                                      0.9
                                    ]),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            Container(
                              child: const Align(
                                alignment: Alignment
                                    .center, // Align however you like (i.e .centerRight, centerLeft)
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'My Artists',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 26,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ]))),
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
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Align(
                                alignment: Alignment
                                    .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'My Songs',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE,
                              height: SQUARE_SIZE,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Align(
                                  alignment: Alignment
                                      .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Playlist 1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ))),
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
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Align(
                                  alignment: Alignment
                                      .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Folder 1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ))),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE,
                              height: SQUARE_SIZE,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Align(
                                  alignment: Alignment
                                      .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Playlist 2',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ))),
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
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Align(
                                  alignment: Alignment
                                      .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Playlist 3',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ))),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE,
                              height: SQUARE_SIZE,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Align(
                                  alignment: Alignment
                                      .bottomCenter, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text('Folder 2',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ),
                                ),
                              ))),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
