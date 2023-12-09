import 'package:flutter/material.dart';
import 'package:ui/models/user.dart';
import 'package:ui/pages/quiz_page.dart';

class TechnologyLivelihood extends StatefulWidget {
  const TechnologyLivelihood({super.key});

  @override
  State<TechnologyLivelihood> createState() => _TechnologyLivelihoodState();
}

class _TechnologyLivelihoodState extends State<TechnologyLivelihood> {
  late Future<User> authuser;

  @override
  void initState() {
    super.initState();
    authuser = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: authuser,
        builder: ((context, AsyncSnapshot snapshot) {
          if(snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  const Text(
                    'Bachelor of Technology and Livelihood Education',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Icon(Icons.quiz_rounded, color: Colors.white),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'General Education',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14
                        ),
                      ),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => QuizPage(userid: snapshot.data.id, courseId: 3, category: 'General', deadline: DateTime.now().add(const Duration(hours: 3)))),
                          );
                        },
                        icon: const Icon(Icons.chevron_right),
                        label: const Text(''),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade400,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0)
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Icon(Icons.quiz_rounded, color: Colors.white),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Profesional Education',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14
                        ),
                      ),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => QuizPage(userid: snapshot.data.id, courseId: 3, category: 'Professional', deadline: DateTime.now().add(const Duration(hours: 3)))),
                          );
                        },
                        icon: const Icon(Icons.chevron_right),
                        label: const Text(''),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade400,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0)
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Icon(Icons.quiz_rounded, color: Colors.white),
                      ),
                      const SizedBox(width: 15),
                      Text(
                        'Field of Specialization',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14
                        ),
                      ),
                      const Spacer(),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => QuizPage(userid: snapshot.data.id, courseId: 3, category: 'Specialization', deadline: DateTime.now().add(const Duration(hours: 3)))),
                          );
                        },
                        icon: const Icon(Icons.chevron_right),
                        label: const Text(''),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade400,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0)
                        ),
                      )
                    ],
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
    );
  }
}