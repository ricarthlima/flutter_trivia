import 'package:flutter/material.dart';
import 'package:flutter_trivia/trivia/api/trivia_api.dart';
import 'package:flutter_trivia/trivia/screens/question_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TriviaApi _api = TriviaApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _api
                .getQuestions(
                    amount: 1, category: CategoryTypes.scienceComputers)
                .then((listQuestion) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => QuestionScreen(question: listQuestion[0]),
                ),
              ).then((value) {
                if (value != null) {
                  SnackBar snackBar = SnackBar(
                    content: Text((value) ? "Correto!" : "Errooooou!"),
                    backgroundColor:
                        (value) ? Colors.green[900] : Colors.red[900],
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              });
            });
          },
          child: const Text("Desafie-me"),
        ),
      ),
    );
  }
}
