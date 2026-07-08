import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildForgetPassword extends StatelessWidget {
  const BuildForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          tr('forgot-password'),
          style: const TextStyle(
            color: Color(0xFFC5A059),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}