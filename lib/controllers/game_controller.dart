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

  //final List<String> initializingWords = ['flutter', 'riverpod', 'stateless'];
  final List<String> initializingWords = [
    'flutter',
  ];

  void initializeGame() {
    initializingWords.shuffle();
    String initializingWordPicker = initializingWords.first;
    List<String> initGameWord = initializingWordPicker.toUpperCase().split('');

    Game initializedGameState = Game(
      initializedGameWord: initGameWord,
      guessedLetters: [],
      gameWon: false,
      initialized: true,
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

    return gameHiddenWord;
  }

  void guessLetter({required String guessedLetter}) {
    List<String> guessedLetters = state.guessedLetters.toList();

    if (guessedLetters.contains(guessedLetter)) {
      return;
    }
    guessedLetters.add(guessedLetter);

    state = Game(
      gameWon: state.gameWon,
      initializedGameWord: state.initializedGameWord,
      guessedLetters: guessedLetters,
      initialized: state.initialized,
    );

    printState();
    checkIfGuessWins();
  }

  void checkIfGuessWins() {
    bool gameWon = true;
    for (String letter in state.initializedGameWord) {
      if (!state.guessedLetters.contains(letter)) {
        gameWon = false;
      }
    }

    state = Game(
      gameWon: gameWon,
      initializedGameWord: state.initializedGameWord,
      guessedLetters: state.guessedLetters,
      initialized: state.initialized,
    );
  }

  String getFormattedGuessedLetters() {
    List<String> guessedLetters = state.guessedLetters;

    guessedLetters.sort();

    return guessedLetters.join("");
  }
}
