// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_escapes, use_build_context_synchronously, avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/components/my_button.dart';
import 'package:login_ui/components/my_textfield.dart';
import 'package:login_ui/components/square_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      //WRONG EMAIL
      if (e.code == 'user-not-found') {
        //show error to user
        // wrongEmailMessage();

        //WRONG PASSWORD
      } else if (e.code == 'wrong password') {
        //show error to user
        //  wrongPasswordMessage();
      }
    }

    //pop the loading circle
    //Navigator.pop(context);
  }

  // //WRONG EMAIL MESSAGE POPUP
  // void wrongEmailMessage() {
  //   showAboutDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         title: Text('Incorrect Email'),
  //       );
  //     },
  //   );
  // }

  // //WRONG PASSWORD MESSAGE POPUP
  // void wrongPasswordMessage() {
  //   showAboutDialog(
  //     context: context,
  //     builder: (context)
  //      {
  //       return const AlertDialog(
  //         title: Text('Incorrect Password'),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            //RenderFlex fix...
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(height: 25),

                //username textfield
                MyTextField(
                  controller: emailController,
                  hintText: "Username",
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.lightBlueAccent),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                //sign in button
                MyButton(
                  onTap: signUserIn,
                ),

                const SizedBox(height: 50),

                //or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or Continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                //google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // google sign in button
                    SquareTile(imagePath: "lib/images/google.png"),

                    SizedBox(width: 20),

                    //apple sign in button
                    SquareTile(imagePath: "lib/images/apple.png"),
                  ],
                ),

                const SizedBox(height: 50),

                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member?",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      "Register Now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
