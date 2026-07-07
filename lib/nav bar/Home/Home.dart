// ignore_for_file: file_names
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:loding_screen/nav%20bar/Home/Widgets/appBar.dart';
import 'package:loding_screen/nav%20bar/Home/Widgets/art_jewelry.dart';
import 'package:loding_screen/nav%20bar/Home/Widgets/banar_ads.dart';
import 'package:loding_screen/nav%20bar/Home/Widgets/featured_collections.dart';
import 'package:loding_screen/widgets/department_titles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int countMessage = 1;
  void clearMessage() {
    setState(() {
      countMessage = 0;
    });
  }

  List<String> imgs = [
    'https://i.pinimg.com/1200x/19/76/90/197690b0b6d367aab22cd65a7cbfd62c.jpg',
    'https://i.pinimg.com/1200x/6f/4c/15/6f4c156b2f170da31135bb60d9c90c4a.jpg',
    'https://i.pinimg.com/736x/bf/bb/e9/bfbbe91ba74ec129708792bdda407198.jpg',
  ];
  List<String> imgStyleGuid = [
    'https://i.pinimg.com/736x/6f/4d/c6/6f4dc629b34a5bda0ee9e43cbcbed72a.jpg',
    'https://i.pinimg.com/736x/8f/f8/82/8ff882521e8050e4c89183af79e46b8d.jpg',
    'https://i.pinimg.com/736x/73/c2/3b/73c23beef6162089a4d1c36f97688d6c.jpg',
    'https://i.pinimg.com/736x/5e/14/56/5e145683e4cac7a0b6ce4804ec666492.jpg',
    'https://i.pinimg.com/1200x/a9/a1/96/a9a19666c742af043d8d660e85dde4f8.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 235, 235),
      drawer: Drawer(),
      appBar: buildAppBar(countMessage: countMessage, context: context,clear:clearMessage ),
      body: ListView(
        children: [
          buildBanarAds(),
          SizedBox(height: 50),
          buildTitleDepartment(
            bold: true,
            title: tr('title-featured'),
            color: Color(0xFFC5A059),
          ),
          buildFeaturedCollections(img: imgs, constraints: 150),
          SizedBox(height: 50),
          buildTitleDepartment(
            bold: true,
            title: tr('title-art'),
            color: Color(0xFFC5A059),
          ),
          buildArtJewelry(),
          SizedBox(height: 50),
          buildTitleDepartment(
            bold: true,
            title: tr('title-art'),
            color: Color(0xFFC5A059),
          ),
          buildFeaturedCollections(img: imgStyleGuid, constraints: 250),
        ],
      ),
    );
  }
}
