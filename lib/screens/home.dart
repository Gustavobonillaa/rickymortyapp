import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:rickymorty/data/app_data.dart';
import 'package:rickymorty/model/categories_model.dart';

import '../data/api_Controller.dart';
import '../model/rickymorty_model.dart';
import '../widget/banner.dart';
import '../widget/categories.dart';
import '../widget/populars.dart';
import '../widget/product_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SizedBox(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Text
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              'Find Your Clothes',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //Banner
          BannerCard(),
          SizedBox(
            height: 10,
          ),
          //Categories
          CategoriesList(),
          SizedBox(
            height: 10,
          ),
          //List
          getCharacters(),
          //Text
          Container(
            margin: EdgeInsets.only(left: 20, top: 15, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Most Popular',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          //List
          MostPopular()
        ]),
      ),
    ));
  }
}

FutureBuilder<List<Ryckymorty>> getCharacters() =>
    FutureBuilder<List<Ryckymorty>>(
        future: apiController.getCharacters(),
        builder: (context, snapshot) {
          print(snapshot);
          if (!snapshot.hasData) {
            return Container(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final List<Ryckymorty> characters = snapshot.data ?? [];
          final bool characterCounter = characters.isNotEmpty;
          if (characterCounter) {
            return _buildMyCharacters(characters);
          } else {
            return Container();
          }
        });

Widget _buildMyCharacters(List<Ryckymorty> characters) {
  return Container(
    height: 330,
    child: ProductorCard(rickymortylist: characters),
  );
}
