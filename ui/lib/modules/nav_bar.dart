import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ui/auth/login.dart';
import 'package:ui/models/user.dart';
import 'package:ui/pages/favorite.dart';
import 'package:ui/pages/home_page.dart';
import 'package:ui/pages/policty.dart';
import 'package:ui/pages/reviewer.dart';
import 'package:ui/pages/settings.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late Future<User> authuser;

  @override
  void initState() {
    super.initState();
    authuser = UserService().getUser();
  }

  void handleLogOut() {
    final box = GetStorage();
    box.remove('token');
    Get.offAll(const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
        future: authuser,
        builder: ((context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.all(0.0),
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(snapshot.data!.fullname),
                  accountEmail: Text(snapshot.data!.email),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/sample.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  )
                ),
                ListTile(
                  leading: const Icon(Icons.book_outlined),
                  title: const Text('Reviewers'),
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Reviewer()),
                  )
                ),
                ListTile(
                  leading: const Icon(Icons.favorite),
                  title: const Text('Favorites'),
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Favorite()),
                  )
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.policy),
                  title: const Text('Policies'),
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Policy()),
                  )
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Settings()),
                  )
                ),
                navList(Icons.logout, 'Sign Out', 'signout')
              ],
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
      ),
    );
  }

  navList(icon, text, page) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () => handleLogOut()
    );
  }
}