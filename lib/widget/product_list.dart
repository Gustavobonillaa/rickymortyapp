import 'package:flutter/material.dart';
import 'package:rickymorty/data/app_data.dart';
import 'package:rickymorty/model/base_model.dart';
import 'package:rickymorty/utils/constants.dart';

import '../model/rickymorty_model.dart';

class ProductorCard extends StatefulWidget {
  const ProductorCard({super.key, required this.rickymortylist});
  final List<Ryckymorty> rickymortylist;

  @override
  State<ProductorCard> createState() => _ProductorCardState();
}

class _ProductorCardState extends State<ProductorCard> {
  late PageController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: 2, viewportFraction: 0.58);
    loadData();
  }

  void loadData() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.42,
      child: PageView.builder(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          itemCount: widget.rickymortylist.length,
          itemBuilder: (context, index) {
            Ryckymorty data = widget.rickymortylist[index];

            return Column(
              children: [
                Container(
                  width: size.width * 0.5,
                  height: size.height * 0.35,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(data.image), fit: BoxFit.cover)),
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
