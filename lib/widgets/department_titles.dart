import 'package:flutter/material.dart';

class BuildTitleDepartment extends StatelessWidget {
  final String title;
  final Color? color;
  final bool bold;
  const BuildTitleDepartment({
    super.key,
    required this.title,
    this.color,
    required this.bold,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: !bold == true ? FontWeight.normal : FontWeight.bold,
          color: color ?? const Color.fromARGB(160, 0, 0, 0),
        ),
      ),
    );
  }
}
