import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:web3dart/web3dart.dart';

class Contract extends StatefulWidget {
  @override
  _Contract createState() => _Contract();
}

class _Contract extends State<Contract> {
  int balance = 0, totalDeposits = 0, installmentAmount = 3;

  late Client httpClient;
  late Web3Client ethClient;
  // JSON-RPC is a remote procedure call protocol encoded in JSON
  // Remote Procedure Call (RPC) is about executing a block of code on another server
  String rpcUrl = 'http://10.0.2.2:7545';

  @override
  void initState() {
    initialSetup();
    super.initState();
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
      '42a087be8642a245f623f6976ea2dcc40f5520c12ae2737891433d627c476336';
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
      addFunds;

  Future<void> getContractFunctions() async {
    contract =
        DeployedContract(ContractAbi.fromJson(abi, "Revio"), contractAddress);

    getWallet = contract.function('getWallet');
    getSubscription = contract.function('getSubscription');
    changeSubscription = contract.function('changeSubscription');
    addFunds = contract.function('addFunds');
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
    print('onWriteContract');
    await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
        contract: contract,
        function: functionName,
        parameters: functionArgs,
      ),
    );
  }

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
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: FloatingActionButton.extended(
                  heroTag: 'check_balance',
                  onPressed: () async {
                    var result = await readContract(getWallet, []);
                    balance = result.first?.toInt();
                    setState(() {});
                  },
                  label: Text('Check Balance'),
                  icon: Icon(Icons.refresh),
                  backgroundColor: Colors.pink,
                ),
              ),
            ),
            Text('${balance}',
                style: TextStyle(
                  color: Colors.white,
                )),
            Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Align(
                    alignment: Alignment.center,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFC4C4C4)),
                      child: Container(
                          width: 200,
                          height: 200,
                          child: Center(child: Text("Deposits"))),
                    ))),
            Container(
                height: 100,
                width: 200,
                margin: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                    onPressed: () async {
                      await writeContract(addFunds, [BigInt.from(3)]);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFFC4C4C4)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                    child: const Text(
                      "Add Funds",
                      maxLines: 1,
                      style: TextStyle(fontSize: 10, color: Colors.black),
                    )))
          ],
        ));
  }
}
