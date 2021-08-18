import 'dart:convert';
import 'package:rick_and_morty_app/data/datasource/api/api.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/data/models/response/characters_response.dart';

abstract class CharacterRepository {
  Future<CharactersResponse> getCharacters({int page = 1});
  Future<CharacterResult> getCharacterDetail(int id);
}

class CharacterRepositoryImpl implements CharacterRepository {
  static CharacterRepository _characterRepository;
  Api _api;

  CharacterRepositoryImpl._() {
    this._api = Api.create();
  }
  static CharacterRepository instance() => _characterRepository =
      _characterRepository ?? CharacterRepositoryImpl._();

  @override
  Future<CharactersResponse> getCharacters({int page = 1}) async {
    final response = await _api.characters(page);
    return CharactersResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<CharacterResult> getCharacterDetail(int id) async {
    final response = await _api.characterDetail(id);
    return CharacterResult.fromJson(jsonDecode(response.body));
  }
}
