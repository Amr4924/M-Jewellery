import 'package:flutter/material.dart';
import 'package:loding_screen/nav%20bar/shop/Widgets/product_card.dart';


class BuildBuildProductsDisplay extends StatelessWidget {
  final List<Map<String, Object>> products;
  const BuildBuildProductsDisplay({super.key,required this.products});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(20),
          topLeft: const Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return buildCardProdut(
              context: context,
              price: products[index]['price'] as String,
              img: products[index]['img'] as String,
              title: products[index]['title'] as String,
            );
          },
        ),
      ),
    );
  }
}
