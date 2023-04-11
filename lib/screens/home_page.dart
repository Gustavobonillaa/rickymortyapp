import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_2/model/episodes_model.dart';
import '../controller/data_controller.dart';
import '../model/character_model.dart';
import '../widgets/banner.dart';
import '../widgets/character_card.dart';
import '../widgets/episode_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FadeInUp(
        delay: const Duration(milliseconds: 300),
        child: SizedBox(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BannerCard(),
                  SizedBox(
                    height: 50,
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabs: const [
                        Tab(
                          text: 'Personajes',
                        ),
                        Tab(
                          text: 'Episodios',
                        ),
                      ],
                      labelStyle:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: size.height * 0.7,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        
                        SizedBox(
                          width: size.width,
                          height: size.height * 0.2,
                          child: FutureBuilder<List<Character>>(
                            future: apiServiceCharacter.getCharacters(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return GridView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final character = snapshot.data![index];
                                    return CharacterCard(
                                        character: character);
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.63),
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return SizedBox(
                                  height: size.height * 0.2,
                                  child: const Center(
                                      child: CircularProgressIndicator()));
                            },
                          ),
                        ),

                        SizedBox(
                          width: size.width,
                          height: size.height * 0.7,
                          child: FutureBuilder<List<Episode>>(
                            future: apiServiceEpisodes.getEpisodes(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  itemCount: snapshot.data!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final episode = snapshot.data![index];
                                    return EpisodeCard(episode: episode);
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text("${snapshot.error}");
                              }
                              return Container(
                                height: size.height * 0.2,
                                child:
                                    const Center(child: CircularProgressIndicator()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
