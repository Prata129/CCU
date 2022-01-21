import 'package:flutter/material.dart';

const double buttonHeight = 60;
const double buttonWidth = 220;

class PaymentsScreen extends StatelessWidget {
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
                title: const Text("Payments",
                    style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
                elevation: 0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/paypal.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(0),
                          child: SizedBox(
                              height: buttonHeight,
                              width: buttonWidth,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: Color(0xFFE5BE58),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Align(
                                  alignment: Alignment
                                      .center, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Login',
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
                        padding: const EdgeInsets.all(0),
                        child: SizedBox(
                          width: 150,
                          height: 40,
                          child: Container(
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    'assets/images/visa.png',
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: SizedBox(
                              width: buttonWidth,
                              height: buttonHeight,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    color: const Color(0xFFE5BE58),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Align(
                                  alignment: Alignment
                                      .center, // Align however you like (i.e .centerRight, centerLeft)
                                  child: Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Add Card',
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
            ],
          ),
        ));
  }
}
