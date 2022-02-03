import 'package:flutter/material.dart';

class BlockchainStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios), onPressed: () => Navigator.of(context).pop(),),
              iconTheme: IconThemeData(color: Color(0xFFC2C2C2)),
              backgroundColor: Color(0xFF222222),
              title: Text("Crypto Stats",
                  style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
              elevation: 0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('\n    Total Contributions for artists:\n', style: TextStyle(fontSize: 20.0, color: Color(0xFFC2C2C2))),
            ),

            Row(
              children:[
                Expanded(
                  child: Text('    Valores dos tokens', style: TextStyle(fontSize: 20.0, color: Color(0xFFC2C2C2)))
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
              ],
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text('      Conversão do dinheiro\n', style: TextStyle(fontSize: 15.0, color: Color(0xFFC2C2C2))),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: Text('\n    How much you\'ve been vibing with us:\n', style: TextStyle(fontSize: 20.0, color: Color(0xFFC2C2C2))),
            ),

            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/graph1.png",
                height: 300,
              ),
            ),



            Align(
              alignment: Alignment.topLeft,
              child: Text('\n    How many tokens you have given:\n', style: TextStyle(fontSize: 20.0, color: Color(0xFFC2C2C2))),
            ),


            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                "assets/images/graph2.png",
                height: 300,
              ),
            ),


            ],
          ),
        )
    );
  }

}