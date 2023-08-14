import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              color: const Color.fromARGB(188, 255, 254, 254),
              width: 350,
              height: 350),
          const SizedBox(height: 50),
          Text(
            "Learn Flutter the fun way",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 24, // Adjust the font size as needed
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text(
              'start quiz',
            ),
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}
