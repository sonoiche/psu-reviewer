import 'package:flutter/material.dart';
import 'package:ui/modules/nav_bar.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemExtent: 150,
          itemCount: 5,
          itemBuilder: (context, index) => Card(
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/sample.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 14,
                  child: Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(
                          'This is just a sample title',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Lorem ipsum dolor sit amet title description or lets say subtitle of a reviewer article another lorem ipsum dolor sit amet',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}