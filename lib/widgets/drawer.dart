import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/Sign%20in/Accounts.dart';
import 'package:loding_screen/Sign%20in/login/login.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          SizedBox(height: 20),
          CircleAvatar(
            minRadius: 80,
            backgroundImage: NetworkImage(
              'https://i.pinimg.com/736x/a3/a2/86/a3a286712476118176013d1dc7ed1d00.jpg',
            ),
          ),

          BuildButtonsDrawer(
            str: SaveRecord.name as String,
            icon: Icons.person,
          ),
          BuildButtonsDrawer(
            str: SaveRecord.email as String,
            icon: Icons.email,
          ),
          BuildButtonsDrawer(
            str: SaveRecord.phone as String,
            icon: Icons.phone,
          ),

          Divider(height: 40),
          ListTile(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
            title: Text(tr('log-out')),
            leading: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}

class BuildButtonsDrawer extends StatelessWidget {
  const BuildButtonsDrawer({super.key, required this.str, required this.icon});
  final String str;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        str,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(icon),
    );
  }
}
