import 'package:flutter/material.dart';


class BannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.2,
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/rick_and_morty.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: Text('Get Now'))
            ],
          ),
        ],
      ),
    );
  }
}