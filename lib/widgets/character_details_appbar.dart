import 'package:flutter/material.dart';
import 'package:proyecto_2/widgets/main_wrapper.dart';

class CharacterAppBar extends StatelessWidget {
  const CharacterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(children: [
        ClipOval( 
          child: Material(
            color: Colors.white, // Button color
            child: InkWell(
              splashColor: Colors.black, // Splash color
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeWrapper())),
              child: const SizedBox(
                  width: 45,
                  height: 45,
                  child: Icon(Icons.keyboard_backspace_sharp, color: Color(0xFF40AEC4),)),
            ),
          ),
        ),
      ]),
    );
  }
}