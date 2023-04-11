import 'package:flutter/material.dart';

import 'package:proyecto_2/widgets/searh.dart';

import '../controller/data_controller.dart';
import '../model/character_model.dart';
import '../screens/home_page.dart';

class HomeWrapper extends StatefulWidget {
  const HomeWrapper({super.key});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  bool isSearchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: Container(),
              ),
              const ListTile(
                leading:
                    Icon(Icons.logout_rounded, color: Colors.white, size: 30),
                title: Text('Cerrar Sesiòn',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isSearchActive = !isSearchActive;
                });
              },
              icon: isSearchActive
                  ? const Icon(
                      Icons.search_off,
                      color: Colors.white,
                      size: 30,
                    )
                  : const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    )),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: isSearchActive ? SearchCharacters() : const HomePage(),
    );
  }
}

FutureBuilder<List<Character>> SearchCharacters() =>
    FutureBuilder<List<Character>>(
        future: apiServiceCharacter.getCharacters(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox(
              height: 300,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          final List<Character> characters = snapshot.data ?? [];
          final bool characterCounter = characters.isNotEmpty;
          if (characterCounter) {
            return _buildSearchCharacter(characters);
          } else {
            return Container();
          }
        });

Widget _buildSearchCharacter(List<Character> characters) {
  return SizedBox(
    height: 1000,
    child: Search(character: characters),
  );
}
