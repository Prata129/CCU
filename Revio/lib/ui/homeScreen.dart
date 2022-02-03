// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revio/ui/settingsScreen.dart';
import 'package:revio/ui/blockchainStats.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
  }


  class _HomePageState extends State<HomePage> {
    int balance = 0, totalDeposits = 0, installmentAmount = 3;

    late http.Client httpClient;
    late Web3Client ethClient;
    String rpcUrl = 'http://127.0.0.1:7545';

    @override
    void initState() {
      //initialSetup();
      super.initState();
    }

    // Future<void> initialSetup() async {
    //   httpClient = http.Client();
    //   ethClient = Web3Client(rpcUrl, httpClient);

    //   await getCredentials();
    //   await getDeployedContracts();
    //   await getContractFunctions();
    // }
    
    /// This will construct [credentials] with the provided [privateKey]
    /// and load the Ethereum address in [myAdderess] specified by these credentials.
    String privateKey =
        '87f394afbfe6d03549bf83f00c374f269d85f8b5bfe9696e818a5e0c29375f4a';
    late Credentials credentials;
    late EthereumAddress myAddress;

    Future<void> getCredentials() async {
      credentials = await EthPrivateKey.fromHex(privateKey);
      myAddress = await credentials.extractAddress();
    }

    /// This will parse an Ethereum address of the contract in [contractAddress]
    /// from the hexadecimal representation present inside the [ABI]
    late String abi;
    late EthereumAddress contractAddress;

    Future<void> getDeployedContracts() async {
      String abiString = await rootBundle.loadString('src/abis/Investment.json');
      var abiJson = jsonDecode(abiString);
      abi = jsonEncode(abiJson['abi']);

      contractAddress =
          EthereumAddress.fromHex(abiJson['networks']['5777']['address']);
    }

    /// This will help us to find all the [public functions] defined by the [contract]
    // late DeployedContract contract;
    // ContractFunction getBalanceAmount,
    //     getDepositAmount,
    //     addDepositAmount,
    //     withdrawBalance;

    // Future<void> getContractFunctions() async {
    //   contract = DeployedContract(
    //       ContractAbi.fromJson(abi, "Investment"), contractAddress);

    //   ContractFunction getBalanceAmount = contract.function('getBalanceAmount');
    //   ContractFunction getDepositAmount = contract.function('getDepositAmount');
    //   ContractFunction addDepositAmount = contract.function('addDepositAmount');
    //   ContractFunction withdrawBalance = contract.function('withdrawBalance');
    // }

    /// This will call a [functionName] with [functionArgs] as parameters
    /// defined in the [contract] and returns its result
    // Future<List<dynamic>> readContract(
    //   ContractFunction functionName,
    //   List<dynamic> functionArgs,
    // ) async {
    //   var queryResult = await ethClient.call(
    //     contract: contract,
    //     function: functionName,
    //     params: functionArgs,
    //   );

    //   return queryResult;
    // }

    // /// Signs the given transaction using the keys supplied in the [credentials] object
    // /// to upload it to the client so that it can be executed
    // Future<void> writeContract(
    //   ContractFunction functionName,
    //   List<dynamic> functionArgs,
    // ) async {
    //   await ethClient.sendTransaction(
    //     credentials,
    //     Transaction.callContract(
    //       contract: contract,
    //       function: functionName,
    //       parameters: functionArgs,
    //     ),
    //   );
    // }

    // int getCriptoBalance() {
    //   readContract(getBalanceAmount, []).then((value) {
    //      balance = value.first;
    //   });
    //   return balance;
    // }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Row(children: [
              /* Align(
                alignment: const AlignmentDirectional(0.7, -0.8),
                child:  */
              Container(
                child: Text('Welcome Back, Zé',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
              //),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0.9, -0.8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen()));
                    },
                    radius: 30,
                    //padding: const EdgeInsets.only(top: 60.0),
                    child: Container(
                        //margin: const EdgeInsets.only(bottom: 40, left: 50),
                        width: 30,
                        height: 30,
                        child: Image.asset('assets/images/settings.png')),
                  ),
                ),
              ),
            ]),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Container(
                width: 291,
                height: 133,
                //color: Color.fromARGB(255, 58, 169, 206),
                decoration: BoxDecoration(
                    color: Color.fromARGB(214, 196, 196, 196),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => BlockchainStats()));
                  },
                  child: Column(
                    children: [
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '  Stats',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        )
                      ]),
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "0",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        )
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                ' 563',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 48,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '.54',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                              ),
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
                          ]),
                      Row(children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            ' 153.73',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                fit: BoxFit.contain,
                                alignment: Alignment.bottomLeft,
                                image: AssetImage(
                                  'assets/images/euro.png',
                                ),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
            )
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(children: [
              Container(
                child: Text('From Revio to you',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                //margin: const EdgeInsets.only(top: 60, bottom: 30),
                height: 146,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(213, 134, 134, 134),
                ),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: SizedBox(
                            width: 140,
                            height: 140,
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/adele25.jpg',
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
                                      'Artists',
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
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 40.0),
            child: Row(children: [
              Container(
                child: Text('Latest Arrivals',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                //margin: const EdgeInsets.only(top: 60, bottom: 30),
                height: 146,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(213, 134, 134, 134),
                ),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: SizedBox(
                            width: 140,
                            height: 140,
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/adele25.jpg',
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
                                      'Artists',
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
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 40.0),
            child: Row(children: [
              Container(
                child: Text('Latest Arrivals',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                //margin: const EdgeInsets.only(top: 60, bottom: 30),
                height: 146,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(213, 134, 134, 134),
                ),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: SizedBox(
                            width: 140,
                            height: 140,
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/adele25.jpg',
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
                                      'Artists',
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
                ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 40.0),
            child: Row(children: [
              Container(
                child: Text('Latest Arrivals',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
              ),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                //margin: const EdgeInsets.only(top: 60, bottom: 30),
                height: 146,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(213, 134, 134, 134),
                ),
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: SizedBox(
                            width: 140,
                            height: 140,
                            child: Stack(children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/adele25.jpg',
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
                                      'Artists',
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
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
