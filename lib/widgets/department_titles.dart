import 'package:flutter/material.dart';

Widget buildTitleDepartment({required String title}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      title,
      style: TextStyle(fontSize: 18, color: const Color.fromARGB(160, 0, 0, 0)),
    ),
  );
}