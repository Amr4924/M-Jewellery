import 'package:flutter/material.dart';

Widget buildTitleDepartment({required String title, Color? color,required bool bold}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight:!bold ==true? FontWeight.normal:FontWeight.bold,
        color: color ?? const Color.fromARGB(160, 0, 0, 0),
        
      ),
    ),
  );
}
