// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapes
import 'package:flutter/material.dart';
import 'package:login_ui/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
 LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              //logo
              Icon(
                Icons.motorcycle_rounded,
                size: 100,
                color: Colors.blue,
              ),
              SizedBox(height: 50),
              //welcome back, you've been missed!
              Text(
                "Welcome back, you\'ve been missed!",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              SizedBox(height: 25),

              //username textfield
              MyTextField(
                controller: usernameController,
                hintText: "UserName",
                obscureText: false,
              ),
              

              SizedBox(height: 15.0),
              //password textfield
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),
              //forgot password

              //sign in button

              //or continue with

              //google + apple sign in buttons

              //not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}
