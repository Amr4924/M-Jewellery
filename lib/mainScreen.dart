// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:loding_screen/nav%20bar/Home/Home.dart';
import 'package:loding_screen/nav%20bar/Profile/profile.dart';
import 'package:loding_screen/nav%20bar/shop/shop.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int indexPage = 0;
  List<Widget> pages = [HomeScreen(), ShopScreen(), ProfileScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[indexPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0A2F1D),
        selectedItemColor: const Color(0xFFC5A059),
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: indexPage,
        onTap: (value) {
          setState(() {
            indexPage = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: tr('nav-home'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: tr('nav-shop'),
            icon: Icon(Icons.diamond_outlined),
          ),
          BottomNavigationBarItem(
            label: tr('nav-profile'),
            icon: Icon(Icons.person_2_outlined),
          ),
        ],
      ),
    );
  }
}
