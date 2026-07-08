import 'package:flutter/material.dart';

class BuildContainerButtom extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? action;
  const BuildContainerButtom({
    super.key,
    required this.icon,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
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
}
