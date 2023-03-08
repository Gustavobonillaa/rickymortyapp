import 'package:rickymorty/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/app_data.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: size.width,
      height: size.height * 0.06,
      
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (context, index){
          Categories cat = categories[index];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
            color: Colors.white,
          ),
          margin: EdgeInsets.symmetric(horizontal: 8, vertical:5),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Text(cat.tittle),
        );
      }) ,
    );
  }
}
