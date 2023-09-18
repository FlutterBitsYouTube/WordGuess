import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/game.dart';
import 'package:flutter/material.dart';

final gameController = StateNotifierProvider<GameController, Game>(
  (ref) {
    return GameController();
  },
);

class GameController extends StateNotifier<Game> {
  GameController() : super(Game.empty());

  void initializeGame({required String initializedWord}) {
    List<String> initGameWord = initializedWord.toUpperCase().split('');

    Game initializedGameState = Game(
      initializedGameWord: initGameWord,
      guessedLetters: [],
      gameWon: false,
    );

    state = initializedGameState;

    printState();
  }

  void printState() {
    debugPrint('Game State Initialized Word: ${state.initializedGameWord.toString()}');
    debugPrint('Game State guessed letters Word: ${state.guessedLetters.toString()}');
    debugPrint('Game State Game Won: ${state.gameWon.toString()}');
  }

  List<String> gameWordRevealed() {
    List<String> gameWordRevealed = state.initializedGameWord;
    List<String> gameHiddenWord = List.generate(gameWordRevealed.length, (index) => '_');
    for (int i = 0; i < gameWordRevealed.length; i++) {
      if (state.guessedLetters.contains(gameWordRevealed[i])) {
        gameHiddenWord[i] = gameWordRevealed[i];
      }
    }

    debugPrint('GameWordRevealed: ${gameHiddenWord.toString()}');
    return gameHiddenWord;
  }

  void guessLetter({required String guessedLetter}) {
    List<String> guessedLetters = state.guessedLetters.toList();
    debugPrint('GuessLetter: ${state.guessedLetters.toString()}');
    if (guessedLetters.contains(guessedLetter)) {
      return;
    }
    guessedLetters.add(guessedLetter);

    state = Game(
      gameWon: state.gameWon,
      initializedGameWord: state.initializedGameWord,
      guessedLetters: guessedLetters,
    );
    debugPrint('GuessLetter: ${state.guessedLetters.toString()}');
    printState();
  }
}
