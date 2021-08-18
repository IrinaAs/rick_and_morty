import 'dart:convert';
import 'package:rick_and_morty_app/data/datasource/api/api.dart';
import 'package:rick_and_morty_app/data/models/fields/episode_result.dart';
import 'package:rick_and_morty_app/data/models/response/episodes_response.dart';

abstract class EpisodeRepository {
  Future<EpisodesResponse> getEpicodes({int page = 1});
  Future<EpisodeResult> getEpicodeDetail(int id);
}

class EpisodeRepositoryImpl implements EpisodeRepository {
  static EpisodeRepository _epicodeRepository;
  Api _api;

  EpisodeRepositoryImpl._() {
    this._api = Api.create();
  }
  static EpisodeRepository instance() =>
      _epicodeRepository = _epicodeRepository ?? EpisodeRepositoryImpl._();

  @override
  Future<EpisodesResponse> getEpicodes({int page = 1}) async {
    final response = await _api.episodes(page);
    return EpisodesResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<EpisodeResult> getEpicodeDetail(int id) async {
    final response = await _api.epicodeDetail(id);
    return EpisodeResult.fromJson(jsonDecode(response.body));
  }
}
