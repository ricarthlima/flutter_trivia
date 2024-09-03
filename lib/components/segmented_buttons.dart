import 'package:flutter/material.dart';
import 'package:flutter_trivia/themes/theme_data.dart';

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
    return Flexible(
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () {
            onTap(difficulty);
          },
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: (difficulty == currentDifficulty)
                    ? theme.colorScheme.primary
                    : theme.colorScheme.surfaceDim),
            child: Text(
              difficulty,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
// TODO: Refatorar segmented buttons
//
// Gerenciar estado (isSelected)
//   - Atualizar estado do seletor
//   - Reagir quando selecionado
//     - Mudar a cor do seletor
//     - Dizer qual a dificuldade selecionada
//
