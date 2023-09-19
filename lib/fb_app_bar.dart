import 'package:flutter/material.dart';

class FBAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FBAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Flutter Bits Hooks'),
      //backgroundColor: Colors.blueGrey,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
