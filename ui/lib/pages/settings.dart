import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/controller/user_controller.dart';
import 'package:ui/models/user.dart';
import 'package:ui/modules/nav_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late Future<User> authuser;
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
    authuser = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: authuser,
        builder: ((context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            final fnameController = TextEditingController(text: snapshot.data!.fname);
            final mnameController = TextEditingController(text: snapshot.data!.mname);
            final lnameController = TextEditingController(text: snapshot.data!.lname);
            final emailController = TextEditingController(text: snapshot.data!.email);
            final mobileController = TextEditingController(text: snapshot.data!.mobileNumber);
            final passwordController = TextEditingController();
            final password2Controller = TextEditingController();
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Personal Information',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    TextFormField(
                      controller: fnameController,
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        errorText: null,
                        border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: mnameController,
                      decoration: const InputDecoration(
                        labelText: 'Middle Name',
                        errorText: null,
                        border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: lnameController,
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        errorText: null,
                        border: OutlineInputBorder()
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: mobileController,
                      decoration: const InputDecoration(
                        labelText: 'Mobile Number',
                        errorText: null,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email Address',
                        errorText: null,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        errorText: null,
                        border: OutlineInputBorder()
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: password2Controller,
                      decoration: const InputDecoration(
                        labelText: 'Retype Password',
                        errorText: null,
                        border: OutlineInputBorder()
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    ButtonTheme(
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue
                        ),
                        onPressed: () async {
                          await UserService().updateUser(
                            userId: snapshot.data!.id,
                            fname: fnameController.text,
                            mname: mnameController.text,
                            lname: lnameController.text,
                            email: emailController.text,
                            mobileNumber: mobileController.text,
                            password: passwordController.text,
                            password2: password2Controller.text
                          );
                        },
                        child: const Text('SAVE CHANGES'),
                      ),
                    ),
                  ],
                ),
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
    );
  }
}