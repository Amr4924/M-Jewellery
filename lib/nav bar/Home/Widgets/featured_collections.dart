import 'package:flutter/material.dart';

Widget buildFeaturedCollections({required List<String> img,required double constraints}) {
  return SizedBox(
    height: constraints,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final imgs = img[index % img.length];
        return Container(
          height: constraints,
          width: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              imgs,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    ),
  );
}

