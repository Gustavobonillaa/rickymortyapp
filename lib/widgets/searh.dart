import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

import '../model/character_model.dart';
import '../screens/characters_details.dart';

class Search extends StatefulWidget {
  const Search({Key? key, required this.character}) : super(key: key);
  final List<Character> character;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController _controller;
  List<Character> searchResult = [];

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    searchResult = widget.character;
  }

  void onSearch(String search) {
    setState(() {
      searchResult = widget.character
          .where((element) => element.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: FadeInUp(
        delay: Duration(milliseconds: 300),
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: size.width,
                  height: size.height * 0.07,
                  child: TextField(
                    onChanged: onSearch,
                    controller: _controller,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                        filled: true,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _controller.clear();
                              searchResult = widget.character;
                              FocusManager.instance.primaryFocus?.unfocus();
                            });
                          },
                          icon: Icon(Icons.close),
                        ),
                        hintText: "e.g. Rick Sanchez",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide: BorderSide.none)),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: searchResult.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.63),
                    itemBuilder: (context, index) {
                      Character data = searchResult[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharacterDetails(
                              character: data,
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: size.width * 0.45,
                              height: size.height * 0.30,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(data.image),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(height: 10),
                            OutlinedText(
                              text: Text(data.name,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF40AEC4))),
                              strokes: [
                                OutlinedTextStroke(
                                    color: const Color(0xff7EAD2E), width: 1),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
