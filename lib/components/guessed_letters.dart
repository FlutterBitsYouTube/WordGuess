import 'package:auto_size_text/auto_size_text.dart';
import '../controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/game.dart';
// ignore_for_file: prefer_const_constructors

class GuessedLetters extends ConsumerWidget {
  const GuessedLetters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Game game = ref.watch(gameController);
    List<String> guessedLetters = game.guessedLetters;
    guessedLetters.sort();
    debugPrint(guessedLetters.toString());
    String guessedLettersText = guessedLetters.join("");

    return Center(
      child: SizedBox(
        width: 500,
        height: 60,
        child: Center(
          child: AutoSizeText(
            guessedLettersText,
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   scrollDirection: Axis.horizontal,
          //   itemCount: game.guessedLetters.length,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       color: Colors.black,
          //       width: 45,
          //       height: 45,
          //       child: Text(
          //         game.guessedLetters[index],
          //         style: TextStyle(color: Colors.white, fontSize: 35),
          //       ),
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
