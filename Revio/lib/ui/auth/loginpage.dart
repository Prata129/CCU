import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:revio/service/auth/authentication_service.dart';
import 'package:revio/service/auth/authentication_state.dart';
import 'package:revio/ui/auth/login_model.dart';
import 'package:revio/ui/buyNosAlive.dart';
import 'package:revio/ui/manager.dart';
import 'package:revio/ui/artistManager.dart';
import 'package:revio/ui/auth/signuppage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<LoginModel>(context, listen: false);
    vm.resetState();
  }

  void _handleCreateAccount(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  Widget _authScreen(BuildContext context, LoginModel viewModel) {
    if (viewModel.state!.authStatus == AuthStatus.error) {
      Future.delayed(Duration.zero, () async {
        //Insert text
      });
    }
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: Image.asset('assets/images/Capturar.PNG')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF737373),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white),
                      hintText: 'Enter valid email id as abc@gmail.com'),
                  onChanged: (value) => viewModel.email = value),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 30, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                obscureText: true,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF737373),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter secure password'),
                onChanged: (value) => viewModel.password = value,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 57,
                  width: 152,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE5BE58),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      /* context.read<AuthenticationService>().signIn(
                      email: emailController.text, 
                      password: passwordController.text.trim()
                      ); */
                      viewModel.loginUser();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ArtistManager()));
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 57,
                  width: 152,
                  decoration: BoxDecoration(
                      color: const Color(0xFFE5BE58),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      _handleCreateAccount(context);
                    },
                    child: const Text(
                      'Create Account',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginModel>(
          builder: (context, viewModel, child) =>
              _authScreen(context, viewModel)),
    );
  }
}
