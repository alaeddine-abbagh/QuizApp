import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summary, {super.key});
  final List<Map<String, Object>> summary;

  @override
  Widget build(context) {
    Color colorAnswer(Map<String, Object> data) {
      return data['user_answer'] == data['correct_answer']
          ? Color.fromARGB(255, 73, 178, 49)
          : Color.fromARGB(255, 199, 138, 58);
    }

    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: summary.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: colorAnswer(data), // Color of the circle
                    foregroundColor: Colors.white,
                    child:
                        Text(((data['question_index'] as int) + 1).toString()),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 20, // Adjust the font size as needed
                            )),
                        SizedBox(height: 10),
                        Text(data['correct_answer'] as String,
                            style: GoogleFonts.lato(
                              color: Color.fromARGB(255, 73, 178, 49),
                              fontSize: 16, // Adjust the font size as needed
                            )),
                        Text(data['user_answer'] as String,
                            style: GoogleFonts.lato(
                              color: colorAnswer(data),
                              fontSize: 16, // Adjust the font size as needed
                            )),
                        SizedBox(height: 20),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
