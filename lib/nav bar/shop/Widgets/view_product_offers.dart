import 'package:flutter/material.dart';
import 'package:loding_screen/nav%20bar/shop/Widgets/offer_card.dart';

Widget buildProductOffers({required List<Map<String, Object>> products,required BuildContext context}) {
  return SizedBox(
    height: 300,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (contetx, index) {
        final img = products[index % products.length]['img'] as String;
        final price = products[index % products.length]['price'] as String;
        final title = products[index % products.length]['title'] as String;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: buildOfferCard(
            context: context,
            img: img,
            price: price,
            title: title,
          ),
        );
      },
    ),
  );
}
