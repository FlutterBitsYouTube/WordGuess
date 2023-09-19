import '../controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore_for_file: prefer_const_constructors

class GuessLetter extends ConsumerWidget {
  const GuessLetter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController textController = TextEditingController(text: '');

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter Guess: ',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          SizedBox(
            width: 50,
            child: TextField(
              controller: textController,
              textAlign: TextAlign.center,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                fillColor: Colors.blue,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
              autofocus: true,
              onChanged: (value) {
                bool validValue = true;
                if (!value.contains(RegExp('^[a-zA-Z]+'))) {
                  textController.text = '';
                  validValue = false;
                }
                if (value.length == 1 && validValue) {
                  String upperCase = value.toUpperCase();
                  debugPrint('save letter');
                  ref.read(gameController.notifier).guessLetter(guessedLetter: upperCase);
                }
                textController.text = '';
              },
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
