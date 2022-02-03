import 'package:flutter/material.dart';
import 'package:revio/ui/buyNosAlive.dart';

const double SQUARE_SIZE = 137;

class NosAliveEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(
          children:[
            AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.of(context).pop(),),
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
                                    width: SQUARE_SIZE,
                                    height: SQUARE_SIZE,
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

                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: Text('NOS Alive’22 \n06/07/2022\nPasseio Marítimo de Algés',textAlign: TextAlign.right, 
                                style: TextStyle(fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white,),),
                            ),
                            Container(
                              height: 32,
                              width: 150,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5BE58),
                                borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => BuyNosAlive()));
                                },
                                child: const Text(
                                  'Buy',
                                  style: TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                  new Column(
                    children: [
                      Container(
                              height: 86,
                              width: 340,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'O NOS Alive regressa ao Passeio Marítimo de Algés para mais um cartaz de excelência. \nEste evento tem, ano após ano, trazido a Portugal grandes nomes do panorama musical internacional. Durante os três dias, sobem aos 3 palcos mais de 60 bandas.',
                                  style: TextStyle(color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ),
                    ],
                  ),
                  new Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20), 
                        child: Text('\nLineup', 
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF), fontSize: 20)),),  
                    ],
                  ),

                  new Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top:5), 
                        child: Image(image: AssetImage('assets/images/JohnImage.png')),),
                      Padding(padding: const EdgeInsets.only(left: 20, top:5), 
                        child: Text('John', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 18, background: Paint().. color = Color(0xFFE5BE58)),),),
                      Padding(padding: const EdgeInsets.only(top:5), 
                        child: Text('                 ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 18,),),),
                      Padding(padding: const EdgeInsets.only(top:5), 
                        child: Text('32 Songs', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 18, background: Paint().. color = Color(0xFFE5BE58)),),),
                      Padding(padding: const EdgeInsets.only(), 
                        child: IconButton(icon: Icon(Icons.play_arrow_sharp, size: 40,), onPressed: () {}),),
                    ],
                  ),

                new Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top:5), 
                        child: Image(image: AssetImage('assets/images/MichyneImage.png')),),
                      Padding(padding: const EdgeInsets.only(left: 20, top:5), 
                        child: Text('Michyne', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 18, background: Paint().. color = Color(0xFFE5BE58)),),),
                      Padding(padding: const EdgeInsets.only(top:5), 
                        child: Text('             ', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 18,),),),
                      Padding(padding: const EdgeInsets.only(top:5), 
                        child: Text('22 Songs', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF000000), fontSize: 18, background: Paint().. color = Color(0xFFE5BE58)),),),
                      Padding(padding: const EdgeInsets.only(), 
                        child: IconButton(icon: Icon(Icons.play_arrow_sharp, size: 40,), onPressed: () {}),),
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