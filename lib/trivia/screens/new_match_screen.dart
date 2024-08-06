import 'package:flutter/material.dart';
import 'package:flutter_trivia/themes/theme_data.dart';
import 'package:flutter_trivia/trivia/api/trivia_api.dart';
import 'package:flutter_trivia/trivia/screens/home_screen.dart';

class NewMatchScreen extends StatefulWidget {
  const NewMatchScreen({super.key});

  @override
  State<NewMatchScreen> createState() => _NewMatchScreenState();
}

class _NewMatchScreenState extends State<NewMatchScreen> {
  double amountQuestions = 1;
  String currentDifficulty = DifficultyTypes.easy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Nova Partida"),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              "Número de Questões",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  flex: 11,
                  child: Slider(
                    value: amountQuestions,
                    min: 1,
                    max: 20,
                    divisions: 19,
                    label: amountQuestions.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        amountQuestions = value;
                      });
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Text(
                    amountQuestions.round().toString(),
                  ),
                ),
              ],
            ),
            const Text(
              "Dificuldade",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DifficultyNewMatchItem(
                  difficulty: DifficultyTypes.easy,
                  currentDifficulty: currentDifficulty,
                  onTap: switchDifficulty,
                ),
                DifficultyNewMatchItem(
                  difficulty: DifficultyTypes.medium,
                  currentDifficulty: currentDifficulty,
                  onTap: switchDifficulty,
                ),
                DifficultyNewMatchItem(
                  difficulty: DifficultyTypes.hard,
                  currentDifficulty: currentDifficulty,
                  onTap: switchDifficulty,
                ),
              ],
            ),
            const Text(
              "Categorias",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(),
            //GridView(gridDelegate: gridDelegate)
          ],
        ),
      ),
    );
  }

  switchDifficulty(String difficulty) {
    setState(() {
      currentDifficulty = difficulty;
    });
  }
}

class DifficultyNewMatchItem extends StatelessWidget {
  final String difficulty;
  final String currentDifficulty;
  final Function onTap;

  const DifficultyNewMatchItem({
    super.key,
    required this.difficulty,
    required this.currentDifficulty,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(difficulty);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 32,
        decoration: BoxDecoration(
            color: (difficulty == currentDifficulty)
                ? Colors.red[900]
                : Colors.grey[900]),
        child: Text(
          difficulty,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
