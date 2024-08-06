import 'package:flutter/material.dart';
import 'package:flutter_trivia/components/buttons.dart';
import 'package:flutter_trivia/trivia/api/trivia_api.dart';
import 'package:flutter_trivia/trivia/helpers/snackbar_default.dart';
import 'package:flutter_trivia/trivia/models/questions.dart';
import 'package:flutter_trivia/trivia/screens/new_match_screen.dart';
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
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Center(
                child: SizedBox(
                  width: 128,
                  height: 128,
                  child: Placeholder(
                    child: Text("LOGO"),
                  ),
                ),
              ),
              const Text(
                "TriviaApp",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 32),
              ),
              PrimaryButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewMatchScreen()));
                  },
                  text: "Iniciar"),
              PrimaryButton(
                onTap: () {
                  showSnackBarDefault(context, "Em construção.");
                },
                text: "Instruções",
              ),
              PrimaryButton(
                onTap: () {
                  showSnackBarDefault(context, "Em construção.");
                },
                text: "Configurações",
              ),
            ],
          ),
        ),
      ),

      // Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       _api
      //           .getQuestions(amount: 1, category: CategoryTypes.animeManga)
      //           .then(
      //         (listQuestion) {
      //           startGame(context, listQuestion);
      //         },
      //       );
      //     },
      //     child: const Text("Desafie-me"),
      //   ),
      // ),
    );
  }

  void startGame(BuildContext context, List<Question> listQuestion) {
    Question question = listQuestion[0];

    question.translateQuestion().then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => QuestionScreen(question: question),
        ),
      ).then(
        (value) {
          if (value != null) {
            SnackBar snackBar = SnackBar(
              content: Text((value) ? "Correto!" : "Errooooou!"),
              backgroundColor: (value) ? Colors.green[900] : Colors.red[900],
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
      );
    });
  }
}
