import 'package:flutter/material.dart';
import 'package:revio/ui/aboutScreen.dart';
import 'package:revio/ui/auth/loginpage.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/ui/songs/playScreen.dart';
import 'package:revio/ui/songs/song_item.dart';

import '../widgets/button.dart';

class CryptoWallet extends StatelessWidget {
  const CryptoWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        iconTheme: const IconThemeData(color: Color(0xFFC2C2C2)),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF222222),
        title: const Text('Crypto Wallet',
            style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, left: 20),
                child: Text(
                  'Account Balance:',
                  style: TextStyle(
                      color: Color(0xFFC2C2C2),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: const Color(0xFFC2C2C2),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'GANACHE \$',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ButtonWidget(
              text: 'Withdraw',
              icon: Icons.currency_exchange,
              color: const Color(0xFFE5BE58),
              onClicked: () =>
                  0, /*{
                              IMPLEMENT GANACHE WITHDRAW
                                        },*/
            ),
          ),
        ],
      ),
    );
  }
}
