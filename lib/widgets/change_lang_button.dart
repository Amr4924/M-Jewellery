
import 'package:flutter/material.dart';
import 'package:loding_screen/feature/change_language.dart';

Widget changeLanguageButton({required BuildContext context}) {
  return IconButton(
    onPressed: () {
        toggleTranslation(context);
    },
    icon: Icon(Icons.language, size: 30, color: const Color(0xFFC5A059)),
  );
}
