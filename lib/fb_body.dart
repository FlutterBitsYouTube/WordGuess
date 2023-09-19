import './components/components.dart';
import './controllers/game_controller.dart';
import './models/game.dart';
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
