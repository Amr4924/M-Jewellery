import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

Widget buildCardProdut({
  required String img,
  required String title,
  required String price,
  required BuildContext context,
}) {
  return Card(
    color: Colors.white,
    clipBehavior: Clip.antiAlias,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Image.network(img, fit: BoxFit.cover, width: double.infinity),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$price \$',
            style: const TextStyle(
              color: Color(0xFFC5A059),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        tr('shop-added-to-cart-success'),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      duration: Duration(seconds: 2),
                      backgroundColor: Color.fromARGB(255, 23, 103, 64),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF0A2F1D),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Color(0xFFC5A059),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
