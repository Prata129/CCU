import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revio/service/auth/authentication_service.dart';
import 'package:revio/ui/manager.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
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
                controller: emailController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color(0xFF737373),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 30, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
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
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Manager()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
