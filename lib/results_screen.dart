import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  ResultsScreen(
      {super.key, required this.selectedAnswers, required this.goHomeScreen});
  List<String> selectedAnswers;
  void Function() goHomeScreen; //= false;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': selectedAnswers[i]
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int nbreOfQquestions = questions.length;

    final int nbreCorrectAnswers = getSummary().where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ' you answerred $nbreCorrectAnswers out of $nbreOfQquestions correctly',
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 74, 77, 117), fontSize: 24),
            ),
            const SizedBox(height: 30),
            Text(
              "List of answers and questions",
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 254, 254, 254), fontSize: 20),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(getSummary()),
            TextButton(
                onPressed: goHomeScreen, child: const Text('Restart Quiz'))
          ],
        ),
      ),
    );
  }
}
