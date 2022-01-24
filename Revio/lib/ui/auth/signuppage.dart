import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revio/service/auth/authentication_state.dart';
import 'package:revio/ui/auth/auth_dialog.dart';
import 'package:revio/ui/auth/signup_model.dart';
import 'package:revio/ui/homepage.dart';
import 'package:revio/ui/profile_view.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  
  @override 
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool? valuefirst = false;  
  
  @override 
  void initState() {
    final vm = Provider.of<SignUpModel>(context, listen: false);
    vm.resetState();
  }

  Widget _authScreen(BuildContext context, SignUpModel viewModel) {
    final loadingIndicator = Center(child: CircularProgressIndicator());
    if (viewModel.state!.authStatus == AuthStatus.loading) {
      return loadingIndicator;
    }

    if (viewModel.state!.authStatus == AuthStatus.authed) {
      WidgetsBinding.instance!.addPostFrameCallback((_) { 
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => ProfileView())
        );
      });
    }

    if (viewModel.state!.authStatus == AuthStatus.error) {
      Future.delayed(Duration.zero, () async {
        AuthDialog.show(context, viewModel.state?.authError);
      });
    }

    final screen = Padding(
      padding: EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sign Up',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline5,
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: TextEditingController()..text = viewModel.email,
            obscureText: false,
            onChanged: (value) {
              viewModel.validateEmail(value);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              return viewModel.validateEmail(value!);
            },
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: TextEditingController()..text = viewModel.password,
            obscureText: true,
            validator: (value) {
              return viewModel.validatePassword(value!);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.black),
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: TextEditingController()..text = viewModel.confirmedPassword,
            obscureText: true,
            validator: (value) {
              return viewModel.validatePasswordMatch(value!);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                labelText: 'Confirm password'),
          ),
          SizedBox(height: 16),
          TextFormField(
            controller: TextEditingController()..text = viewModel.displayName,
            validator: (value) {
              return viewModel.validadeUsername(value!);
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
                labelText: 'Enter your username'),
          ),
          Row(
            children: <Widget>[  
              SizedBox(width: 10),  
                    Text('Are you an artist?',style: TextStyle(fontSize: 17.0), ),  
                    Checkbox(  
                      checkColor: Colors.greenAccent,  
                      activeColor: Colors.red,  
                      value: this.valuefirst,  
                      onChanged: (bool? value) {  
                        setState(() {  
                          viewModel.validateArtist(value);
                          this.valuefirst = value; 
                  });  
                },  
              ),  
            ],  
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => viewModel.registerUser(),
              child: Text(
                'Sign up'.toUpperCase(),
                style: TextStyle(color: Colors.grey.shade100),
              ),
            ),
          )
        ],
      ),
    );
    return screen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hi")
      ),
      body: Consumer<SignUpModel>(
        builder: (context, viewModel, child) =>
          _authScreen(context, viewModel)));
  }
}