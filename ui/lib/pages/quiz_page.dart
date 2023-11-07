import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui/models/question.dart';
import 'package:ui/models/user.dart';
import 'package:ui/pages/home_page.dart';
import 'package:ui/pages/quiz_result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({required this.courseId, required this.category, super.key});

  final int courseId;
  final String category;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);

  PageController? controller = PageController(initialPage: 0);
  bool isPressed = false;
  bool isAlertSet = false;
  int chosen = 100;
  Color isTrue = Colors.blue.shade900;
  Color isWrong = Colors.red;
  int totalCount = 0;

  late Future<List<Question>> questions;
  late Future questionCount;
  late Future<User> authuser;

  @override
  void initState() {
    super.initState();
    questions = QuestionService().getQuestionsByCourse(widget.courseId, widget.category);
    questionCount = QuestionService().getQuestionsCount(widget.courseId, widget.category);
    authuser = UserService().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: const Text('Examination'),
      ),
      body: FutureBuilder(
        future: Future.wait([
          questions,
          authuser,
          questionCount
        ]),
        builder: ((context, AsyncSnapshot snapshot) {
          questionCount.then((value) {
            if(value == 0) {
              showDialogBox('empty', 'Sorry, there\'s no available question on this category.');
            }
          });

          if(snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(18.0),
              child: PageView.builder(
                controller: controller!,
                onPageChanged: (page) {
                  setState(() {
                    isPressed = false;
                  });
                },
                itemCount: snapshot.data[0]!.length,
                itemBuilder: (context, index) {
                  if(snapshot.data[0].isNotEmpty) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "Question ${index + 1}/${snapshot.data[0]!.length}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
                                fontSize: 28.0
                              ),
                            ),
                          ),
                          const Divider(color: Colors.white, height: 4.0, thickness: 2.0),
                          const SizedBox(height: 20.0),
                          Text(
                            snapshot.data[0]![index].question,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24.0
                            ),
                          ),
                          const SizedBox(height: 35.0),
                          for(int i = 0; i < snapshot.data[0]![index].jsonOptions.length; i++)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 18.0),
                              child: MaterialButton(
                                shape: const StadiumBorder(),
                                color: (chosen == i) ?
                                  isTrue :
                                  secondColor,
                                padding: const EdgeInsets.symmetric(vertical: 18.0),
                                onPressed: (){
                                  setState(() {
                                    chosen = i;
                                  });
                                },
                                child: Text(
                                  snapshot.data[0]![index].jsonOptions[i],
                                  style: const TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  style: const ButtonStyle(
                                    //
                                  ),
                                  onPressed: () async {
                                    if(chosen != 100) {
                                      await QuestionService().storeUserExam(
                                        userId: snapshot.data[1]!.id,
                                        questionId: snapshot.data[0]![index].id,
                                        userAnswer: snapshot.data[0]![index].jsonOptions[chosen]
                                      );
                    
                                      if(index + 1 == snapshot.data[0]!.length) {
                                        if (!mounted) return;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => QuizResult(userId: snapshot.data[1]!.id, courseId: widget.courseId, category: widget.category)),
                                        );
                                      }
                    
                                      controller!.nextPage(
                                        duration: const Duration(microseconds: 750),
                                        curve: Curves.bounceIn
                                      );
                                      isPressed = false;
                                      chosen = 100;
                                    } else {
                                      showDialogBox('question','Please give us your answer before proceeding to the next question.');
                                    }
                                  },
                                  child: Text(
                                    index + 1 == snapshot.data[0]!.length ? 'Show Result' : 'Next Question',
                                    style: const TextStyle(
                                      color: Colors.white
                                    ),
                                  )
                                )
                              ],
                            )
                        ],
                      ),
                    );
                  }
                }
              )
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

  showDialogBox(type, message) => showCupertinoDialog<String>(
    context: context,
    builder: ((context) => CupertinoAlertDialog(
      title: const Text('Error!'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            if(type == 'question') {
              Navigator.pop(context, 'Cancel');
              setState(() {
                isAlertSet = false;
              });
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }
          },
          child: const Text('OK')
        )
      ],
    ))
  );
}