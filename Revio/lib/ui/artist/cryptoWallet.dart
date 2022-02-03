import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';

import 'package:flutter/material.dart';
import 'package:revio/ui/aboutScreen.dart';
import 'package:revio/ui/auth/loginpage.dart';
import 'package:revio/models/OneSong_model.dart';
import 'package:revio/data/song_repo.dart';
import 'package:revio/ui/songs/playScreen.dart';
import 'package:revio/ui/songs/song_item.dart';

import '../../data/user_repo.dart';
import '../../models/user_model.dart';
import '../widgets/button.dart';

class CryptoWallet extends StatefulWidget {
  @override
  _CryptoWallet createState() => _CryptoWallet();
}

class _CryptoWallet extends State<CryptoWallet> {
  int balance = 0, totalDeposits = 0, installmentAmount = 3;
  final UserRepo _userRepo = UserRepo();
  double _money = 00.00;
  int _amount = 0;
  late TextEditingController _controller;

  late Client httpClient;
  late Web3Client ethClient;
  // JSON-RPC is a remote procedure call protocol encoded in JSON
  // Remote Procedure Call (RPC) is about executing a block of code on another server
  String rpcUrl = 'http://10.0.2.2:7545';

  @override
  void initState() {
    initialSetup();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> initialSetup() async {
    /// This will start a client that connects to a JSON RPC API, available at RPC URL.
    /// The httpClient will be used to send requests to the [RPC server].
    httpClient = Client();

    /// It connects to an Ethereum [node] to send transactions, interact with smart contracts, and much more!
    ethClient = Web3Client(rpcUrl, httpClient);

    await getCredentials();
    await getDeployedContract();
    await getContractFunctions();
  }

  String privateKey =
      'b416b2c6a36be58db13d237850909d75ef5d37f9c32475cd10e0f2675a3ae389';
  late Credentials credentials;
  late EthereumAddress myAddress;

  Future<void> getCredentials() async {
    credentials = EthPrivateKey.fromHex(privateKey);
    myAddress = await credentials.extractAddress();
  }

  /// This will parse an Ethereum address of the contract in [contractAddress]
  /// from the hexadecimal representation present inside the [ABI]
  late String abi;
  late EthereumAddress contractAddress;

  Future<void> getDeployedContract() async {
    String abiString = await rootBundle.loadString('src/abis/Revio.json');
    var abiJson = jsonDecode(abiString);
    abi = jsonEncode(abiJson['abi']);

    contractAddress =
        EthereumAddress.fromHex(abiJson['networks']['5777']['address']);
  }

  /// This will help us to find all the [public functions] defined by the [contract]
  late DeployedContract contract;
  late ContractFunction getWallet,
      getSubscription,
      changeSubscription,
      addFunds,
      withdraw;

  Future<void> getContractFunctions() async {
    contract =
        DeployedContract(ContractAbi.fromJson(abi, "Revio"), contractAddress);

    getWallet = contract.function('getWallet');
    getSubscription = contract.function('getSubscription');
    changeSubscription = contract.function('changeSubscription');
    addFunds = contract.function('addFunds');
    withdraw = contract.function('withdraw');
  }

  /// This will call a [functionName] with [functionArgs] as parameters
  /// defined in the [contract] and returns its result
  Future<List<dynamic>> readContract(
    ContractFunction functionName,
    List<dynamic> functionArgs,
  ) async {
    var queryResult = await ethClient.call(
      contract: contract,
      function: functionName,
      params: functionArgs,
    );

    return queryResult;
  }

  /// Signs the given transaction using the keys supplied in the [credentials] object
  /// to upload it to the client so that it can be executed
  Future<void> writeContract(
    ContractFunction functionName,
    List<dynamic> functionArgs,
  ) async {
    await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: functionName,
        parameters: functionArgs,
      ),
    );
  }

  double getBalance() {
    _userRepo.getUser().then((User user) {
      setState(() async {
        var result = await readContract(getWallet, []);
        _money = result.first?.toDouble();
      });
    });
    return _money;
  }

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
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${getBalance()}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
          TextField(
            controller: _controller,
            onSubmitted: (String value) {
              _amount = int.parse(value);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ButtonWidget(
              text: 'Withdraw',
              icon: Icons.currency_exchange,
              color: const Color(0xFFE5BE58),
              onClicked: () async {
                await writeContract(withdraw, [BigInt.from(_amount)]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ButtonWidget(
              text: 'Add Money',
              icon: Icons.add,
              color: const Color(0xFFE5BE58),
              onClicked: () async {
                await writeContract(addFunds, [BigInt.from(_amount)]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
