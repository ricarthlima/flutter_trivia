import 'package:flutter/material.dart';
import 'package:flutter_trivia/components/segmented_buttons.dart';
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
  Map<String, int> mapCategorias = {
    "Geral": CategoryTypes.general,
    "Livros": CategoryTypes.books,
    "Filmes": CategoryTypes.movies,
    "Música": CategoryTypes.music,
    "Jogos": CategoryTypes.videoGames,
    "Quadrinhos": CategoryTypes.comics,
    "Anime/Mangá": CategoryTypes.animeManga,
    "Arte": CategoryTypes.art,
    "História": CategoryTypes.history,
    "Geografia": CategoryTypes.geography,
  };

  List<String> listaCategoriasSelecionadas = [];
  List<String> listaCategoriasDisponiveis = [];

  @override
  void initState() {
    listaCategoriasDisponiveis = mapCategorias.keys.toList();
    listaCategoriasDisponiveis.sort();
    super.initState();
  }

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
        actions: [
          IconButton(
            onPressed: () {
              // TriviaApi().generateQuestionsByUser(
              //   amount: amountQuestions.toInt(),
              //   difficulty: currentDifficulty,
              //   categories: listaCategoriasSelecionadas,
              // );
            },
            icon: const Icon(Icons.check),
          ),
        ],
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
            SegmentedContainer(
              segments: <Segment>[
                Segment(
                  label: "Easy",
                  value: DifficultyTypes.easy,
                  currentValue: currentDifficulty,
                  updateCurrentValue: switchDifficulty,
                ),
                Segment(
                  label: "Medium",
                  value: DifficultyTypes.medium,
                  currentValue: currentDifficulty,
                  updateCurrentValue: switchDifficulty,
                ),
                Segment(
                  label: "Hard",
                  value: DifficultyTypes.hard,
                  currentValue: currentDifficulty,
                  updateCurrentValue: switchDifficulty,
                ),
              ],
            ),
            const Text(
              "Categorias",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: (listaCategoriasSelecionadas.isEmpty)
                  ? const Text(
                      "Nenhuma categoria selecionada",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    )
                  : Wrap(
                      children: List.generate(
                        listaCategoriasSelecionadas.length,
                        (index) {
                          String categoria = listaCategoriasSelecionadas[index];
                          return ElevatedButton(
                            onPressed: () {
                              setState(() {
                                listaCategoriasSelecionadas.remove(categoria);
                                listaCategoriasDisponiveis.add(categoria);

                                listaCategoriasDisponiveis.sort();
                              });
                            },
                            child: Text(categoria),
                          );
                        },
                      ),
                    ),
            ),
            const SizedBox(height: 16),
            Wrap(
              children: List.generate(
                listaCategoriasDisponiveis.length,
                (index) {
                  String categoria = listaCategoriasDisponiveis[index];
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        listaCategoriasSelecionadas.add(categoria);
                        listaCategoriasDisponiveis.remove(categoria);

                        listaCategoriasSelecionadas.sort();
                      });
                    },
                    child: Text(categoria),
                  );
                },
              ),
            )
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
