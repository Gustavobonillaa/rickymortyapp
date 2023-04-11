import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';
import 'package:proyecto_2/model/character_model.dart';
import '../widgets/character_details_appbar.dart';

class CharacterDetails extends StatefulWidget {
  const CharacterDetails({super.key, required this.character});
  final Character character;

  @override
  State<CharacterDetails> createState() => _CharacterDetailsState();
}

class _CharacterDetailsState extends State<CharacterDetails> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            FadeInUp(
              delay: const Duration(milliseconds: 300),
              child: Container(
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.character.image),
                        fit: BoxFit.cover),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    alignment: Alignment.topCenter,
                    child: const CharacterAppBar(),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: SizedBox(
                height: size.height * 0.35,
                width: size.width,
                child: Column(
                  children: [
                    FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      child: Row(
                        children: [
                          OutlinedText(
                            text: const Text('Nombre:',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF40AEC4))),
                            strokes: [
                              OutlinedTextStroke(
                                  color: const Color(0xff7EAD2E), width: 1),
                            ],
                          ),
                          const SizedBox(width: 20,),
                          OutlinedText(
                            text: Text(widget.character.name,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF40AEC4))),
                            strokes: [
                              OutlinedTextStroke(
                                  color: Color(0xff7EAD2E), width: 1),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      delay: const Duration(milliseconds: 1000),
                      child: Row(
                        children: [
                          OutlinedText(
                            text: const Text('Genero:',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF40AEC4))),
                            strokes: [
                              OutlinedTextStroke(
                                  color: Color(0xff7EAD2E), width: 1),
                            ],
                          ),
                          const SizedBox(width: 20,),
                          OutlinedText(
                            text: Text(widget.character.gender,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF40AEC4))),
                            strokes: [
                              OutlinedTextStroke(
                                  color: const Color(0xff7EAD2E), width: 1),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      delay: const Duration(milliseconds: 1500),
                      child: Row(
                        children: [
                          OutlinedText(
                            text: const Text('Especie:',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF40AEC4))),
                            strokes: [
                              OutlinedTextStroke(
                                  color: const Color(0xff7EAD2E), width: 1),
                            ],
                          ),
                          const SizedBox(width: 20,),
                          OutlinedText(
                            text: Text(widget.character.species,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF40AEC4))),
                            strokes: [
                              OutlinedTextStroke(
                                  color: const Color(0xff7EAD2E), width: 1),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      delay: const Duration(milliseconds: 2000),
                      child: Row(
                        children: [
                          OutlinedText(
                            text: const Text('Status:',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF40AEC4))),
                            strokes: [
                              OutlinedTextStroke(
                                  color: const Color(0xff7EAD2E), width: 1),
                            ],
                          ),
                          const SizedBox(width: 20),
                          OutlinedText(
                            text: Text(widget.character.status,
                                style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF40AEC4))),
                            strokes: [
                              OutlinedTextStroke(
                                  color: const Color(0xff7EAD2E), width: 1),
                            ],
                          )
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
