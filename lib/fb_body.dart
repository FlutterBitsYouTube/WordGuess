import './components/draw_game_word.dart';
import './components/guess_letter.dart';
import './components/guessed_letters.dart';
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DrawGameWord(),
          GuessLetter(),
          GuessedLetters(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  ref.read(gameController.notifier).initializeGame(initializedWord: 'flutter');
                },
                child: Text(
                  'New Game',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
          ),
          SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}
