import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

import '../model/character_model.dart';
import '../screens/characters_details.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CharacterDetails(
                    character: character,
                  ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.28,
            width: size.width * 0.6,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(character.image), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedText(
              text: Text(character.name,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF40AEC4))),
              strokes: [
                OutlinedTextStroke(color: const Color(0xff7EAD2E), width: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
