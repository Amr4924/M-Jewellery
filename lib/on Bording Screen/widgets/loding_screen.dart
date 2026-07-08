import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildLodingScreen extends StatelessWidget {
  const BuildLodingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF0A2F1D)),
      child: Center(
        child: ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFC5A059),
                Color(0xFFFFD700),
                Color(0xFFD4AF37),
                Color(0xFFFFEEBB),
                Color(0xFFD4AF37),
              ],
            ).createShader(bounds);
          },
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 35.0,
              fontFamily: 'Schyler',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            child: AnimatedTextKit(
              pause: Duration(milliseconds: 1500),
              animatedTexts: [
                TypewriterAnimatedText(tr('loading_screen1')),
                TypewriterAnimatedText(tr('loading_screen2')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
