import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ui/auth/login.dart';
import 'package:ui/components/button.dart';
import 'package:ui/components/input_field.dart';
import 'package:ui/models/auth.dart';
import 'package:ui/models/user.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late StreamSubscription subscription;
  late Future<List<Course>> courses;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
    courses = UserService().getCourseOptions();
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
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  int dropdownValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: courses,
          builder: ((context, AsyncSnapshot snapshot) {
            if(snapshot.hasData) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    Image.asset(
                      'assets/images/logo.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 50),
                    Text(
                      'Welcome back yout\'ve been missed!',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16
                      ),
                    ),
                    const SizedBox(height: 25),
                    InputField(
                      controller: fnameController,
                      hintText: 'First Name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      controller: lnameController,
                      hintText: 'Last Name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      controller: mobileNumberController,
                      hintText: 'Mobile Number',
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
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
                      child: DropdownButton<int>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.grey,
                        ),
                        onChanged: (int? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: snapshot.data[0].map<DropdownMenuItem<String>>((item) =>
                          DropdownMenuItem<String>(
                            value: item.id,
                            child: Text(item.name)
                          )
                        ).toList()
                      ),
                    ),
                    CustomButton(
                      bgColor: Colors.blue,
                      btnText: 'Sign Up',
                      onTap: () async {
                        await authController.register(
                          fname: fnameController.text,
                          lname: lnameController.text,
                          mobileNumber: mobileNumberController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          courseId: dropdownValue
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
                              'Already have an account?',
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
                      btnText: 'Login Here',
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ),
                    ),
                  ],
                ),
              );
            } else if(snapshot.hasError) {
              return Text('ERROR: ${snapshot.error}');
            }

            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.3,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          })
        )
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