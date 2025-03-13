/*
login page
on this page user can login into the app with email and pw

Once user is successfully log in, they will be redirected to the homepage
if user doesn't have an account they can go to the register page from here.
 */

import 'package:flutter/material.dart';
import 'package:untitled/features/auth/presentation/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final pwController = TextEditingController();


  // Build UI
  @override
  Widget build(BuildContext context) {
    // Scaffold
    return Scaffold(
      // body
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                //logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 50,),

                // welcome back msg
                Text("Welcome back, you've been missed!",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25,),

                // email textfield
                MyTextField(
                    controller: emailController,
                    obscureText: false,
                    hintText: "Email",
                ),
                 const SizedBox(height: 10,),
                // pw textfield
                MyTextField(
                  controller: pwController,
                  obscureText: true,
                  hintText: "Email",
                ),

                // login button

                // not a member? register now
              ],
            ),
          ),
        ),
      ),

    );
  }
}
