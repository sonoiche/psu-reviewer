import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ui/models/question.dart';
import 'package:ui/models/user.dart';
import 'package:ui/pages/home_page.dart';
import 'package:ui/pages/quiz_result.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({
    required this.courseId,
    required this.category,
    required this.deadline,
    required this.userid,
    this.textStyle,
    this.labelTextStyle,
    super.key
  });

  final int userid;
  final int courseId;
  final String category;
  final DateTime deadline;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late StreamSubscription subscription;
  late Timer timer;
  Duration duration = const Duration();

  var isDeviceConnected = false;
  var isTimerActive = false;

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

    calculateTimeLeft(widget.deadline, widget.userid);
    timer = Timer.periodic(const Duration(seconds: 1), (_) => calculateTimeLeft(widget.deadline, widget.userid));

    questions = QuestionService().getQuestionsByCourse(widget.courseId, widget.category);
    questionCount = QuestionService().getQuestionsCount(widget.courseId, widget.category);
    authuser = UserService().getUser();
    getConnectivity();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  getConnectivity() => subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) async {
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if (isDeviceConnected) {
      popupBox();
    }
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = widget.textStyle ?? Theme.of(context).textTheme.headlineSmall!;
    var labelTextStyle = widget.labelTextStyle ?? Theme.of(context).textTheme.bodyMedium!;

    final hours = DefaultTextStyle(
      style: textStyle, 
      child: Text(duration.inHours.toString().padLeft(2, '0'))
    );

    final minutes = DefaultTextStyle(
      style: textStyle,
      child: Text(duration.inMinutes.remainder(60).toString().padLeft(2, '0'))
    );

    final seconds = DefaultTextStyle(
      style: textStyle,
      child: Text(duration.inSeconds.remainder(60).toString().padLeft(2, '0'))
    );

    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        title: const Text('Examination'),
      ),
      body: FutureBuilder(
        future: Future.wait([questions, authuser, questionCount]),
        builder: ((context, AsyncSnapshot snapshot) {
          questionCount.then((value) {
            if (value == 0) {
              showDialogBox('empty', 'Sorry, there\'s no available question on this category.');
            }
          });

          if (snapshot.hasData) {
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
                  if (snapshot.data[0].isNotEmpty) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback:(bounds) => const LinearGradient(colors: [
                                      Colors.white,
                                      Colors.white
                                    ]).createShader(
                                      Rect.fromLTWH(0, 0, bounds.width, bounds.height)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: hours,
                                    ),
                                  ),
                                  DefaultTextStyle(
                                    style: labelTextStyle,
                                    child: const Text(
                                      'Hours',
                                      style: TextStyle(color: Colors.white, fontSize: 11),
                                    )
                                  )
                                ],
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback:(bounds) => const LinearGradient(colors: [
                                      Colors.white,
                                      Colors.white
                                    ]).createShader(
                                      Rect.fromLTWH(0, 0, bounds.width, bounds.height)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: minutes,
                                    ),
                                  ),
                                  DefaultTextStyle(
                                    style: labelTextStyle,
                                    child: const Text(
                                      'Minutes',
                                      style: TextStyle(color: Colors.white, fontSize: 11),
                                    )
                                  )
                                ],
                              ),
                              const SizedBox(width: 10.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ShaderMask(
                                    blendMode: BlendMode.srcIn,
                                    shaderCallback:(bounds) => const LinearGradient(colors: [
                                      Colors.white,
                                      Colors.white
                                    ]).createShader(
                                      Rect.fromLTWH(0, 0, bounds.width, bounds.height)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: seconds,
                                    ),
                                  ),
                                  DefaultTextStyle(
                                    style: labelTextStyle,
                                    child: const Text(
                                      'Seconds',
                                      style: TextStyle(color: Colors.white, fontSize: 11),
                                    )
                                  )
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15.0),
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
                          const Divider(
                            color: Colors.white,
                            height: 4.0,
                            thickness: 2.0
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            snapshot.data[0]![index].question,
                            style: const TextStyle(
                              color: Colors.white, fontSize: 24.0
                            ),
                          ),
                          const SizedBox(height: 35.0),
                          for (int i = 0; i < snapshot.data[0]![index].jsonOptions.length; i++)
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 18.0),
                            child: MaterialButton(
                              shape: const StadiumBorder(),
                              color: (chosen == i) ? isTrue : secondColor,
                              padding: const EdgeInsets.symmetric(vertical: 18.0),
                              onPressed: () {
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
                                style: const ButtonStyle(),
                                onPressed: () async {
                                  if (chosen != 100) {
                                    await QuestionService().storeUserExam(
                                      userId: snapshot.data[1]!.id,
                                      questionId: snapshot.data[0]![index].id,
                                      userAnswer: snapshot.data[0]![index].jsonOptions[chosen]
                                    );

                                    if (index + 1 == snapshot.data[0]!.length) {
                                      if (!mounted) return;
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => QuizResult(
                                          userId: snapshot.data[1]!.id,
                                          courseId: widget.courseId,
                                          category: widget.category)
                                        ),
                                      );
                                    }

                                    controller!.nextPage(duration: const Duration( microseconds: 750), curve: Curves.bounceIn);
                                    isPressed = false;
                                    chosen = 100;
                                  } else {
                                    showDialogBox('question', 'Please give us your answer before proceeding to the next question.');
                                  }
                                },
                                child: Text(index + 1 == snapshot.data[0]!.length ? 'Show Result' : 'Next Question',
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
          } else if (snapshot.hasError) {
            return Text('ERROR: ${snapshot.error}');
          }

          return SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      ))
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
            if (type == 'question') {
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

  popupBox() => showCupertinoDialog<String>(
    context: context,
    builder: ((context) => CupertinoAlertDialog(
      title: const Text('Reminder'),
      content: const Text('You only have 1 hour to complete this exam.'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'Cancel');
            setState(() {
              isAlertSet = false;
            });
          },
          child: const Text('OK')
        )
      ],
    ))
  );

  timesupBox(userid) => showCupertinoDialog<String>(
    context: context,
    builder: ((context) => CupertinoAlertDialog(
      title: const Text('Sorry'),
      content: const Text('You run out of time taking the exam.'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => QuizResult(
                userId: userid,
                courseId: widget.courseId,
                category: widget.category)
              ),
            );
          },
          child: const Text('OK')
        )
      ],
    ))
  );

  void calculateTimeLeft(DateTime deadline, int userid) {
    final seconds = deadline.difference(DateTime.now()).inSeconds;
    if(seconds == 0) {
      timesupBox(userid);
    }
    if(seconds > 0) {
      setState(() {
        duration = Duration(seconds: seconds);
      });
    }
  }
}
