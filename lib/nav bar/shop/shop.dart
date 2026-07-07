import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:loding_screen/nav%20bar/shop/Widgets/product_display.dart';
import 'package:loding_screen/nav%20bar/shop/Widgets/showcasing_featured_products.dart';
import 'package:loding_screen/nav%20bar/shop/Widgets/view_product_offers.dart';
import 'package:loding_screen/widgets/animated_title.dart';
import 'package:loding_screen/widgets/department_titles.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  List<Map<String, Object>> products = [
    {
      "img":
          'https://i.pinimg.com/1200x/19/76/90/197690b0b6d367aab22cd65a7cbfd62c.jpg',
      'title': 'Emerald Drops',
      'price': '180',
    },
    {
      "img":
          'https://i.pinimg.com/1200x/6f/4c/15/6f4c156b2f170da31135bb60d9c90c4a.jpg',
      'title': 'Emerald Blooms',
      'price': '240',
    },
    {
      "img":
          'https://i.pinimg.com/736x/bf/bb/e9/bfbbe91ba74ec129708792bdda407198.jpg',
      'title': 'Emerald Trio',
      'price': '350',
    },
    {
      "img":
          'https://i.pinimg.com/736x/f6/f7/94/f6f7945e503172fc237bd1b719110499.jpg',
      'title': 'Emerald Leaf',
      'price': '150',
    },
    {
      "img":
          'https://i.pinimg.com/736x/ef/be/40/efbe40a705a772cf287a961da7fc8c71.jpg',
      'title': 'Sapphire Halo',
      'price': '220',
    },
    {
      "img":
          'https://i.pinimg.com/736x/f2/0a/7b/f20a7ba82fb3f8e80bba8d6393b8e883.jpg',
      'title': 'Victoria Set',
      'price': '450',
    },
    {
      "img":
          'https://i.pinimg.com/736x/e4/5f/10/e45f10a94d729ebb11d74718f3a029b8.jpg',
      'title': 'Emerald Cascade',
      'price': '550',
    },
    {
      "img":
          'https://i.pinimg.com/736x/af/06/44/af06445511169c10c853feb328005821.jpg',
      'title': 'Emerald Collar',
      'price': '380',
    },
    {
      "img":
          'https://i.pinimg.com/736x/df/25/96/df25962373c1b81bfd1adee079542c6c.jpg',
      'title': 'Imperial Choker',
      'price': '650',
    },
    {
      "img":
          'https://i.pinimg.com/736x/4f/f2/b9/4ff2b97d0c5496226b4473a84be102a5.jpg',
      'title': 'Royal Lace',
      'price': '600',
    },

    {
      "img":
          'https://i.pinimg.com/736x/51/a8/db/51a8dbc708870985263e353ca0f36d3d.jpg',
      'title': 'Tiara Necklace',
      'price': '480',
    },
    {
      "img":
          'https://i.pinimg.com/736x/17/fe/05/17fe05d5d982fd6872ccd9085b7a5ee6.jpg',
      'title': 'Ocean Tennis',
      'price': '290',
    },
    {
      "img":
          'https://i.pinimg.com/736x/a8/b0/7e/a8b07eb9fc074d48d771f8b917de8515.jpg',
      'title': 'Eternity Band',
      'price': '190',
    },
    {
      "img":
          'https://i.pinimg.com/736x/a0/e7/d0/a0e7d0150f379f9e3e15edc239248c78.jpg',
      'title': 'Forever Solitaire',
      'price': '250',
    },
    {
      "img":
          'https://i.pinimg.com/736x/27/9f/e4/279fe471c1409c2431e19bc4c2151904.jpg',
      'title': 'Celestial Ring',
      'price': '320',
    },
    {
      "img":
          'https://i.pinimg.com/736x/f2/0b/b8/f20bb876c471297640aedfafc5e0a341.jpg',
      'title': 'Millennium Ring',
      'price': '390',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 235, 235),
      drawer: Drawer(),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0A2F1D),
        iconTheme: IconThemeData(color: const Color(0xFFC5A059)),
        title: buildAnimatedTitle(title: tr('shop-title')),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          buildFeaturedProducts(),
          SizedBox(height: 30),
          buildTitleDepartment(
            bold: false,
            title: tr('shop-exclusive-section'),
          ),
          buildProductOffers(context: context, products: products),
          SizedBox(height: 30),
          buildTitleDepartment(bold: false, title: tr('shop-offers-section')),
          buildProductOffers(context: context, products: products),
          SizedBox(height: 30),
          buildTitleDepartment(bold: false, title: tr('shop-products-section')),
          buildBuildProductsDisplay(products),
        ],
      ),
    );
  }
}
