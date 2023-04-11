import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/character_model.dart';
import 'package:dio/dio.dart';

import '../model/episodes_model.dart';

class RickAndMortyApiService {
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<List<Character>> getCharacters() async {
    try {
      final response = await dio.get('/character');
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((characterJson) => Character.fromJson(characterJson))
            .toList();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (error) {
      throw Exception('Failed to load characters');
    }
  }

}

final apiServiceCharacter = RickAndMortyApiService();

class RickAndMortyApiServiceEpisodes {
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  Future<List<Episode>> getEpisodes() async {
    try {
      final response = await dio.get('/episode');
      if (response.statusCode == 200) {
        return (response.data['results'] as List)
            .map((EpisodeJson) => Episode.fromJson(EpisodeJson))
            .toList();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (error) {
      throw Exception('Failed to load characters');
    }
  }

}

final apiServiceEpisodes = RickAndMortyApiServiceEpisodes();