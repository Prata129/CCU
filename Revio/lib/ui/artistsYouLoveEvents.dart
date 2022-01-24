import 'package:flutter/material.dart';

const double SQUARE_SIZE = 61;

class ArtistsYouLoveEvents extends StatelessWidget {
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
              title: Text("Artists You Love",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
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
                  child:Image.asset('assets/images/NOSPrimaveraSound.png', fit: BoxFit.cover, width: SQUARE_SIZE,
                  height: SQUARE_SIZE),
                ),
                ),
                Positioned(left: SQUARE_SIZE + 15, top: 3.5, child: Text('NOS Primavera Sound’22 23/07/2022\nPorto', 
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
                  child:Image.asset('assets/images/SumolSummerFest.png', fit: BoxFit.cover, width: SQUARE_SIZE,
                  height: SQUARE_SIZE),
                ),
                ),
                Positioned(left: SQUARE_SIZE + 15, top: 3.5, child: Text('Sumol Summer Fest’22 03/08/2022\nEriceira', 
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
                  child:Image.asset('assets/images/EDPBeachParty.png', fit: BoxFit.cover, width: SQUARE_SIZE,
                  height: SQUARE_SIZE),
                ),
                ),
                Positioned(left: SQUARE_SIZE + 15, top: 3.5, child: Text('EDP Beach Party’22 06/08/2022\nMatosinhos', 
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
                  child:Image.asset('assets/images/VodafoneParedesDeCoura.png', fit: BoxFit.cover, width: SQUARE_SIZE,
                  height: SQUARE_SIZE),
                ),
                ),
                Positioned(left: SQUARE_SIZE + 15, top: 3.5, child: Text('Vodafone Paredes De Coura’22 19/08/2022\nParedes de Coura', 
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


          ]
        )
      )
    );

  }
}