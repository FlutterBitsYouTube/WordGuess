import '../controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/game.dart';
// ignore_for_file: prefer_const_constructors

class GuessEntryWarning extends ConsumerWidget {
  const GuessEntryWarning({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Game game = ref.watch(gameController);

    String buttonText = game.gameWon ? 'New Game' : 'Restart';

    return Center(
      child: ElevatedButton(
          onPressed: () {
            ref.read(gameController.notifier).initializeGame(initializedWord: 'flutter');
          },
          child: Text(
            buttonText,
            style: TextStyle(color: Colors.white, fontSize: 30),
          )),
    );
  }
}
