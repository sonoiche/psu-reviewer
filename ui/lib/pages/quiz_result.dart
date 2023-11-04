import 'package:flutter/material.dart';
import 'package:ui/models/question.dart';
import 'package:ui/models/user.dart';
import 'package:ui/modules/nav_bar.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({required this.userId, required this.courseId, required this.category, super.key});

  final int userId;
  final int courseId;
  final String category;

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  late Future<ExamResult> result;
  late Future<User> authuser;

  @override
  void initState() {
    super.initState();
    result = ExamService().getExamResult(widget.userId, widget.courseId, widget.category);
    authuser = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Text('Examination Result'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.wait([
            result,
            authuser
          ]),
          builder: ((context, AsyncSnapshot snapshot) {
            if(snapshot.hasData) {
              if(snapshot.data[0]!.examStatus == 'Passed') {
                return const Center(
                  child: Column(
                    children: [
                      Text('Congratulations!')
                    ]
                  ),
                );
              } else {
                return const Center(
                  child: Column(
                    children: [
                      Text('Sorry, you failed the exam. Please try again some other time.')
                    ]
                  ),
                );
              }
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
}