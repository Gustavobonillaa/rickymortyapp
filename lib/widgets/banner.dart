import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
        child: Image.asset(
      'asset/images/Rick-and-Morty-500x281.png',
      width: size.width,
      height: size.height * 0.2,
    ));
  }
}
