import 'package:flutter/material.dart';

Widget buildCardSpecialOffers({required String img}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(20),
    ),
    clipBehavior: Clip.antiAlias,
    child: Image.network(img, fit: BoxFit.cover, width: double.infinity),
  );
}