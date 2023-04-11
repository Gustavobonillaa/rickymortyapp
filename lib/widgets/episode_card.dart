import 'package:flutter/material.dart';
import '../model/episodes_model.dart';

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    Key? key,
    required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: size.height * 0.13,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Row(
                  children: [
                    const Text(
                      'Episodio:',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(episode.id.toString(),
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Text('Nombre:',
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(episode.name,
                        style: const TextStyle(color: Colors.white))
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Text('Fecha de emisiòn::',
                        style: TextStyle(color: Colors.white)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(episode.airDate,
                        style: const TextStyle(color: Colors.white))
                  ],
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
