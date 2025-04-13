import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';


class RegisterPage extends StatefulWidget {
  final void Function()? togglePages;
  const RegisterPage({super.key, required this.togglePages});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final confirmPwController = TextEditingController();



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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.lock_open_rounded,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),

                const SizedBox(height: 50,),

                // Create an account
                Text("Create an account, Join Us",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25,),

                // name textfield
                MyTextField(
                  controller: nameController,
                  obscureText: false,
                  hintText: "Name",
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
                  hintText: "Password",
                ),
                const SizedBox(height: 10,),

                // confirm pw textfield
                MyTextField(
                  controller: confirmPwController,
                  obscureText: true,
                  hintText: "Confirm Password",
                ),

                const SizedBox(height: 25,),

                // register button
                MyButton(
                  onTap: (){},
                  text: "Register",
                ),

                const SizedBox(height: 50,),

                // Already a member, Login in Now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already a Member?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.togglePages ,
                      child: Text("Login Now!",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
