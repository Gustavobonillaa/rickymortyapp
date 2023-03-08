import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../data/app_data.dart';
import '../model/base_model.dart';

class MostPopular extends StatefulWidget {
  const MostPopular({super.key});

  @override
  State<MostPopular> createState() => _MostPpopularState();
}

class _MostPpopularState extends State<MostPopular> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*0.44,
      
      child: GridView.builder(
        physics:  BouncingScrollPhysics(),
        itemCount: product.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.63), itemBuilder: (context, index){
           Product data = product[index];
          return Column(
              children: [
                Container(
                  width: size.width*0.45,
                  height: size.height * 0.32,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(data.imgUrl), fit: BoxFit.cover)),
                          child: Column(
                            
                    children: [
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(data.name,
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 5,
                ),
                Text("€${data.price.toString()}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              ],
            );
      }),
    );
  }
}