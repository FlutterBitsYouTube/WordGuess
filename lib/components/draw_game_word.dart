import '../controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../models/game.dart';
// ignore_for_file: prefer_const_constructors

class DrawGameWord extends ConsumerWidget {
  const DrawGameWord({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Game game = ref.watch(gameController);

    List<String> gameWordRevealed = ref.read(gameController.notifier).gameWordRevealed();

    return Center(
      child: SizedBox(
        width: 500,
        height: 60,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: game.initializedGameWord.length,
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blue,
                width: 45,
                height: 45,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    gameWordRevealed[index],
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
