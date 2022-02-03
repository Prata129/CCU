import 'package:flutter/material.dart';
import 'package:revio/ui/aboutScreen.dart';
import 'package:revio/ui/artist/cryptoWallet.dart';
import 'package:revio/ui/auth/loginpage.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/ui/songs/playScreen.dart';
import 'package:revio/ui/songs/song_item.dart';

import '../widgets/button.dart';

class ArtistStatsScreen extends StatelessWidget {
  const ArtistStatsScreen({Key? key}) : super(key: key);

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
        title: const Text('Stats',
            style: TextStyle(fontSize: 32.0, color: Color(0xFFC2C2C2))),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ButtonWidget(
              text: 'Crypto Wallet',
              icon: Icons.account_balance_wallet,
              color: const Color(0xFFE5BE58),
              onClicked: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CryptoWallet()))
              },
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 40, left: 20),
              child: Text(
                'This Month\'s Top Songs',
                style: TextStyle(
                    color: Color(0xFFC2C2C2),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 300,
                height: 200,
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        'assets/images/artistchart.png',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(
                  width: 50,
                  height: 220,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'assets/images/artistlegend.png',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
