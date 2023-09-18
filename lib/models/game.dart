class Game {
  List<String> initializedGameWord;
  List<String> guessedLetters;
  bool gameWon;

  Game({
    required this.initializedGameWord,
    required this.guessedLetters,
    required this.gameWon,
  });

  factory Game.empty() => Game(
        initializedGameWord: [],
        guessedLetters: [],
        gameWon: false,
      );
}
