import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContractView extends StatelessWidget{

  final _balance = 0;
  final _deposits = 0;
  final _installments = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        title: Text("title"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 20.0), 
            child: Align( 
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFC4C4C4)
                ),
              child: Container(
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    "Balance")
                  )
                ),
              )
            )
          ),
          Padding(padding: EdgeInsets.only(top: 20.0), 
            child: Align( 
              alignment: Alignment.center,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFC4C4C4)
                ),
              child: Container(
                width: 200,
                height: 200,
                child: Center(
                  child: Text(
                    "Deposits")
                  )
                ),
              )
            )
          ),
          Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {}, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFFC4C4C4)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder (
                    borderRadius: BorderRadius.circular(10) 
                  )
                )
              ),
              child: const Text(
                "Add Funds",
                maxLines: 1,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.black
                ),
              )
            )
          )
        ],
      )
    );

  }
  
}