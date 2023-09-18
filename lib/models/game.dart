class Game {
  List<String> initializedGameWord;
  List<String> guessedLetters;
  bool gameWon;
  bool initialized;

  Game({
    required this.initializedGameWord,
    required this.guessedLetters,
    required this.gameWon,
    required this.initialized,
  });

  factory Game.empty() => Game(
        initializedGameWord: [],
        guessedLetters: [],
        gameWon: true,
        initialized: false,
      );
}
