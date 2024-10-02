import 'package:flutter/material.dart';
import 'package:flutter_trivia/trivia/api/trivia_api.dart';
import 'package:flutter_trivia/trivia/screens/question_screen.dart';

import '../models/questions.dart';

class LoadingScreen extends StatefulWidget {
  final int amount;
  final String difficulty;
  final List<int> categories;
  const LoadingScreen({
    super.key,
    required this.amount,
    required this.difficulty,
    required this.categories,
  });

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: TriviaApi().generateQuestionsByUser(
          amount: widget.amount,
          difficulty: widget.difficulty,
          categories: widget.categories,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                return const Center(child: Text("Nenhuma questão :("));
              }

              List<Question> listQuestions = snapshot.data!;

              return Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            QuestionScreen(question: listQuestions[0]),
                      ),
                    );
                  },
                  child: const Text("Começar jogo"),
                ),
              );
          }
        },
      ),
    );
  }
}
