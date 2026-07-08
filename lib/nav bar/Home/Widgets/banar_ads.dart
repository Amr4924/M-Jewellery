import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BuildBanarAds extends StatelessWidget {
  const BuildBanarAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Image.network(
            'https://i.pinimg.com/736x/af/06/44/af06445511169c10c853feb328005821.jpg',
            width: double.infinity,

            alignment: Alignment.center,
          ),

          Positioned(
            bottom: 20,
            left: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr('title-ad'),
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                Text(
                  tr('ads'),
                  style: TextStyle(
                    color: Color(0xFFC5A059),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
