import 'package:flutter/material.dart';

const double SQUARE_SIZE = 61;
const double SQUARE_SIZE_BIG = 150;

class EventsHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
              iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
              backgroundColor: Color(0xFF222222),
              title: Text("Events",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: const Align(
                    alignment: Alignment
                        .centerLeft, // Align however you like (i.e .centerRight, centerLeft)
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '\n We Suggest',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),

                Container(
                  child: const Align(
                    //alignment: Alignment
                      //  .centerRight, // Align however you like (i.e .centerRight, centerLeft)
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        '\nYour Balance:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                            backgroundColor: Color(0xFFE5BE58)),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 20),
              height: 68,
              width: 390,
              decoration: BoxDecoration(
                  color: const Color(0x80C4C4C4),
                  borderRadius: BorderRadius.circular(10),
                  ),
              child: Stack(children: <Widget>[
                Positioned(left: 7.5, top: 3.5, child: SizedBox(
                  child:Image.asset('assets/images/nosalive.png', fit: BoxFit.cover, width: SQUARE_SIZE,
                  height: SQUARE_SIZE),
                ),
                ),
                Positioned(left: SQUARE_SIZE + 15, top: 3.5, child: Text('NOS Alive’22 06/07/2022\nPasseio Marítimo de Algés', 
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,),),),
                Positioned(left: SQUARE_SIZE + 15, top: 3.5, child: Text('\n\nWith John’s Performance', 
                  style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                  backgroundColor: Color(0xFFE5BE58))))
              ],
              ),
            ),
            //quadrados iguais aos do Rafa
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20, top: 20),
                        child: SizedBox(
                            width: SQUARE_SIZE_BIG,
                            height: SQUARE_SIZE_BIG,
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/artists_you_love.png',
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
                                      'Artists You Love',
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
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE_BIG,
                              height: SQUARE_SIZE_BIG,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/popular.png',
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
                                        'Popular',
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
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE_BIG,
                              height: SQUARE_SIZE_BIG,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/near_you.png',
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
                                        'Near You',
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
                          padding: const EdgeInsets.only(bottom: 20, top: 20),
                          child: SizedBox(
                              width: SQUARE_SIZE_BIG,
                              height: SQUARE_SIZE_BIG,
                              child: Stack(children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                        'assets/images/our_top_picks.png',
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
                                        'Our Top Picks',
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
      ),
    );
  }
}