import 'dart:convert';
import 'package:http/http.dart';
import '../model/rickymorty_model.dart';
import '../repositories/api_Repository.dart';
import 'package:http/http.dart' as http;

class ApiController{

  final apiRepository = ApiRepository();

  Future<List<Ryckymorty>> getCharacters() async {
    final Response response = await apiRepository.getCharacters();
    List<Ryckymorty> characters = [];

    final bool validateStatusCode = response.statusCode == 200;
    if (validateStatusCode) {
      final Map dataFromAPI = jsonDecode(response.body);
      final List<dynamic> charactersResults = dataFromAPI["results"];

      characters = charactersResults
          .map((character) => Ryckymorty.fromJson(character))
          .toList();
    }
    return characters;
  }
}

final apiController = ApiController();

