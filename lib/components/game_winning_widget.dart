import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore_for_file: prefer_const_constructors

class GameWinningWidget extends ConsumerWidget {
  const GameWinningWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SizedBox(
        width: 500,
        height: 60,
        child: Center(
            child: Text(
          'You Have Won!!',
          style: TextStyle(color: Colors.white, fontSize: 35),
        )),
      ),
    );
  }
}
