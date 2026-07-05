import 'package:flutter/material.dart';

Widget buildOfferCard({
  required String img,
  required String title,
  required String price,
  required BuildContext context,
}) {
  return SizedBox(
    width: 220,
    child: InkWell(
      onTap: () {},
      child: Card(
        color: const Color.fromARGB(255, 239, 235, 235),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                img,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
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
          ],
        ),
      ),
    ),
  );
}
