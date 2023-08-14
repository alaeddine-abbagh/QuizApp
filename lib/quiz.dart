import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String activeScreen = "start_screen";
  bool goHomeScreen = false;

  //@override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "questions_screen";
    });
  }

  void goStartScreen() {
    setState(() {
      activeScreen = "start_screen";
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = "results_screen";
        //selectedAnswers = [];
      });
    }
  }

  @override
  Widget build(context) {
    Widget widgetSreen = activeScreen == "start_screen"
        ? StartScreen(switchScreen)
        : QuestionScreen(onSelectAnswer: chooseAnswer);
    if (activeScreen == "results_screen") {
      widgetSreen = ResultsScreen(
        selectedAnswers: selectedAnswers,
        goHomeScreen: goStartScreen,
      );
    }
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Expanded(
            flex: 2,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      // Handle button 1 press
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // This sets the text color
                    ),
                    child: Text('Question 1'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      // Handle button 2 press
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // This sets the text color
                    ),
                    child: Text('Question 2'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: TextButton(
                    onPressed: () {
                      // Handle button 3 press
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white, // This sets the text color
                    ),
                    child: Text('Question 3'),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromARGB(255, 195, 105, 210),
                Color.fromARGB(255, 154, 12, 180)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: widgetSreen),
      ),
    );
  }
}

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  MainAppBar({super.key, required this.title});
  final Text title;
  final double barHeight = 50.0;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 100.0);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 100),
      child: ClipPath(
        clipper: WaveClip(),
        child: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              title,
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    final lowPoint = size.height - 30;
    final highPoint = size.height - 60;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 4, highPoint, size.width / 2, lowPoint);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, lowPoint);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
