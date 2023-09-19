import 'package:auto_size_text/auto_size_text.dart';
import '../controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore_for_file: prefer_const_constructors

class GuessedLetters extends ConsumerWidget {
  const GuessedLetters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String guessedLettersText = ref.watch(gameController.notifier).getFormattedGuessedLetters();

    return Center(
      child: SizedBox(
        width: 500,
        height: 60,
        child: Center(
          child: AutoSizeText(
            guessedLettersText,
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
      ),
    );
  }
}
