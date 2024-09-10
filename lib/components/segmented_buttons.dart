import 'package:flutter/material.dart';
import 'package:flutter_trivia/themes/theme_data.dart';

class SegmentedContainer extends StatelessWidget {
  final List<Segment> segments;

  const SegmentedContainer({super.key, required this.segments});

  @override
  Widget build(BuildContext context) {
    return Row(children: segments,);
  }
}

class Segment extends StatelessWidget {
  /// É o texto que aparece dentro do botão `Segment`.
  final String label;
  /// É o valor *final* definido do `Segment` atual.
  final dynamic value;
  /// É o valor observado pelos `Segments`.
  /// 
  /// Esse valor precisa ser passado de forma igual para cada `Segment` dentro de um `SegmentContainer`.
  final dynamic currentValue;
  /// É uma função que atualiza o estado do `currentValue`.
  /// 
  /// Precisa receber um novo valor e atualizar o currentValue chamando um `setState()`.
  /// 
  /// ```dart
  /// switchDifficulty(String difficulty) {
  ///   setState(() {
  ///     currentDifficulty = difficulty;
  ///   });
  /// }
  /// ```
  final Function updateCurrentValue;

  const Segment({
    super.key,
    required this.label,
    required this.value,
    required this.currentValue,
    required this.updateCurrentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: InkWell(
          onTap: () {
            updateCurrentValue(value);
          },
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: (value == currentValue)
                    ? theme.colorScheme.primary
                    : theme.colorScheme.surfaceDim),
            child: Text(
              label,
              style: TextStyle(color: (value == currentValue) ? theme.colorScheme.onPrimary : theme.colorScheme.onSurface),
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

/*
Vai ser ignorado com sucesso
*/
