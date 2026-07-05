import 'package:flutter/material.dart';

Widget buildContainerButtom({
  required BuildContext context,
  required IconData icon,
  required String title,
  VoidCallback? action,
}) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: ListTile(
        onTap: action,

        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        leading: Icon(icon, color: const Color(0xFFC5A059)),
        trailing: Icon(Icons.chevron_right, color: const Color(0xFFC5A059)),
      ),
    ),
  );
}
