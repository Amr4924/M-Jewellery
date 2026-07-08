import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BuildAnimatedTitle extends StatelessWidget {
  final String title;
  const BuildAnimatedTitle({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Color(0xFFC5A059),
        fontSize: 24,
        fontFamily: 'PlayfairDisplay',
        fontWeight: FontWeight.bold,
      ),
      // ignore: sort_child_properties_last
      child: AnimatedTextKit(
        totalRepeatCount: 1,
        animatedTexts: [TyperAnimatedText(title)],
      ),
    );
  }
}
