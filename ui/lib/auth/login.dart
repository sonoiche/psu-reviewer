import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ui/auth/register.dart';
import 'package:ui/components/button.dart';
import 'package:ui/components/input_field.dart';
import 'package:ui/models/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() => subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if(!isDeviceConnected && isAlertSet == false) {
      showDialogBox();
      setState(() {
        isAlertSet = true;
      });
    }
  });

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  AuthController authController = Get.put(AuthController());
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.jpg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 25),
                InputField(
                  controller: emailController,
                  hintText: 'Email Address',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                InputField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[600]
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  bgColor: Colors.blue,
                  btnText: 'Sign In',
                  onTap: () async {
                    await authController.login(
                      password: passwordController.text,
                      email: emailController.text
                    );
                  },
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Not a member yet?',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  bgColor: Colors.black,
                  btnText: 'Register Here',
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
    context: context,
    builder: ((context) => CupertinoAlertDialog(
      title: const Text('No Connection'),
      content: const Text('Please check your internet connection.'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() {
              isAlertSet = false;
            });
            isDeviceConnected = await InternetConnectionChecker().hasConnection;
            if(!isDeviceConnected) {
              showDialogBox();
              setState(() {
                isAlertSet = true;
              });
            }
          },
          child: const Text('OK')
        )
      ],
    ))
  );
}