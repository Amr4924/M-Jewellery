import 'package:flutter/material.dart';
import 'package:loding_screen/nav%20bar/shop/Widgets/special_offer_card.dart';

Widget buildFeaturedProducts() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: 300,
      width: double.infinity,
      child: PageView(
        children: [
          buildCardSpecialOffers(
            img:
                'https://i.pinimg.com/736x/51/a8/db/51a8dbc708870985263e353ca0f36d3d.jpg',
          ),
          buildCardSpecialOffers(
            img:
                'https://i.pinimg.com/736x/17/fe/05/17fe05d5d982fd6872ccd9085b7a5ee6.jpg',
          ),
          buildCardSpecialOffers(
            img:
                'https://i.pinimg.com/736x/a8/b0/7e/a8b07eb9fc074d48d771f8b917de8515.jpg',
          ),
        ],
      ),
    ),
  );
}
