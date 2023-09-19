import './fb_body.dart';
import './fb_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: FBHooks()));
}

class FBHooks extends StatelessWidget {
  const FBHooks({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: const FBAppBar(),
        body: Container(
          color: Colors.blue[200],
          child: const FBBody(),
        ),
      ),
    );
  }
}
