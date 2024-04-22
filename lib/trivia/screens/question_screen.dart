import 'package:flutter/material.dart';
import 'package:flutter_trivia/trivia/models/questions.dart';

class QuestionScreen extends StatefulWidget {
  final Question question;
  const QuestionScreen({super.key, required this.question});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> listAnswers = [];

  @override
  void initState() {
    listAnswers = widget.question.shuffleQuestion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                Uri.decodeFull(widget.question.question),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(listAnswers.length, (index) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context,
                          listAnswers[index] == widget.question.correctAnswer);
                    },
                    child: Text(Uri.decodeFull(listAnswers[index])),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
