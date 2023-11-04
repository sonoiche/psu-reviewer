import 'package:flutter/material.dart';

class RecentlyAdded extends StatefulWidget {
  const RecentlyAdded({super.key});

  @override
  State<RecentlyAdded> createState() => _RecentlyAddedState();
}

class _RecentlyAddedState extends State<RecentlyAdded> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                child: Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/sample.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Sample Title',
                        style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet puntas volin tas...',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[400]
                          ),
                        ),
                      ),
                    ),
                  ]
                )
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                child: Container(
                  height: 200,
                  width: 200,
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/sample.jpg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
              ),
              SizedBox(
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        'Sample Title',
                        style: TextStyle(
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Lorem ipsum dolor sit amet puntas volin tas...',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[400]
                          ),
                        ),
                      ),
                    ),
                  ]
                )
              ),
            ],
          ),
        ],
      ),
    );
  }
}