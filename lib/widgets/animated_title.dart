import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

Widget buildAnimatedTitle({required String title}) {
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
