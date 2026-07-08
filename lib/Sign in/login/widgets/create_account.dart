import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/Sign%20in/createAccount.dart';

class BuildCreateAccount extends StatelessWidget {
  const BuildCreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          tr('signUpPrompt'),
          style: const TextStyle(color: Color(0xFFC5A059), fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateAccoundScreen()),
            );
          },
          child: Text(
            tr('create-account'),
            style: const TextStyle(
              color: Color(0xFFC5A059),
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
