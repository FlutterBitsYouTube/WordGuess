import 'package:fbhooks/components/game_start_button.dart';
import 'package:fbhooks/components/game_winning_widget.dart';
import 'package:fbhooks/controllers/game_controller.dart';
import 'package:fbhooks/models/game.dart';

import './components/draw_game_word.dart';
import './components/guess_letter.dart';
import './components/guessed_letters.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// ignore_for_file: prefer_const_constructors

class FBBody extends ConsumerWidget {
  const FBBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Game game = ref.watch(gameController);
    bool showWinningWidget = false;
    if (game.gameWon && game.initialized) {
      showWinningWidget = true;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DrawGameWord(),
          GuessLetter(),
          GuessedLetters(),
          showWinningWidget ? GameWinningWidget() : SizedBox(),
          GameStartButton(),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}
