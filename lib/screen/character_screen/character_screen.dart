import 'package:flutter/material.dart';
import 'package:mahabharat/screen/character_screen/character_screen_widget.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: characterScreenAppBar,
      body: characterScreenBody(),
    );
  }
}
