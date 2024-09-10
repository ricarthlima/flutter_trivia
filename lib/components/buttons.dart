// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_trivia/themes/theme_data.dart';
import 'package:flutter_trivia/utils/conts.dart';

class PrimaryButton extends StatelessWidget {
  final Function onTap;
  final String text;
  const PrimaryButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Ink(
          padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
          decoration: BoxDecoration(
            borderRadius: AppBorder.button,
            color: theme.colorScheme.primaryContainer,
            boxShadow: kElevationToShadow[1],
          ),
          child: Text(text, textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
