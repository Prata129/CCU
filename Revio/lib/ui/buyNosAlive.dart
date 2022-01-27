import 'package:flutter/material.dart';

const double SQUARE_SIZE = 137;

class BuyNosAlive extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(
          children:[
            AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
              iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
              backgroundColor: Color(0xFF222222),
              title: Text("Nos Alive'22",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
            ),

            Container(
              height: 480,
              width: 380,
              decoration: BoxDecoration(
                  color: const Color(0xFFE5E5E5).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10)),
              child: new Column(
                children: [
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                child: SizedBox(
                                    width: SQUARE_SIZE*1.5,
                                    height: SQUARE_SIZE*1.5,
                                    child: Stack(children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          image: const DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              'assets/images/nosalive.png',
                                            ),
                                          ),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ])),
                              )
                            ],
                        ),

                    ],
                  ),
                  new Column(
                    children: [
                      Text('NOS ALIVE\n', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 20),),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 35,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                        child: Text('Balance: ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize:18),),
                      ),
                      Container(
                        height: 35,
                        width: 90,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                        child: Text('Price: 50', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize:18),),
                      ),
                    ], 
                  ),
                  new Row(children: [Text('\n\n')],),
                  new Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5BE58),
                          borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: (){
                            //Add funds screen
                          },
                          child: const Text('Add Funds', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize:18),),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE5BE58),
                          borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: (){
                            //PopUp
                          },
                          child: Text('Finish Purchase', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize:18),),
                        ),
                      ),
                    ],
                    ),
                ],
              )
                    
            ),
          ]
        )
      )
    );

  }
}