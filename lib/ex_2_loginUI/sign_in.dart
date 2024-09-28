import 'package:flutter/material.dart';
import 'package:flutter_course/ex_2_loginUI/sign_up.dart';
import 'package:flutter_course/ex_2_loginUI/widgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -40,
            top: -80,
            child: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              radius: 85,
            ),
          ),
          const Positioned(
            right: -40,
            top: -80,
            child: CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 75,
            ),
          ),
          Positioned(
            left: 24,
            bottom: -110,
            child: CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              radius: 85,
            ),
          ),
          const Positioned(
            left: 20,
            bottom: -105,
            child: CircleAvatar(
              backgroundColor: Colors.indigo,
              radius: 75,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black12,
                      offset: Offset(1, 1),
                      blurStyle: BlurStyle.outer,
                    ),
                  ]),
                  margin: const EdgeInsets.only(right: 40),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 28,
                  ),
                  width: 300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        ),
                      ),
                      const SizedBox(height: 28),
                      const MyTextField(
                        hintText: 'Name',
                        iconData: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      const MyTextField(
                        hintText: 'Password',
                        iconData: Icons.lock,
                        isObsecureText: true,
                      ),
                      const SizedBox(height: 20),
                      MyButton(text: 'SIGN UP', onPressed: () {}),
                      const SizedBox(height: 16),
                      const Text(
                        "Forgot Password?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account? ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (_) => const SignUp()));
                              },
                              child: const Text(
                                "SIGN UP",
                              ))
                        ],
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
