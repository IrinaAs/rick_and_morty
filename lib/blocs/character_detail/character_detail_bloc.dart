import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/data/repository/character_repository.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/navigation/core/navigation_controller.dart';
import 'package:rick_and_morty_app/ui/page/episodes_page.dart';
import 'package:rick_and_morty_app/ui/page/location_detail_page.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/utils/string_ext.dart';
import './bloc.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final GlobalNavigator _globalNavigator;
  final LocalRepository _localRepository;
  final CharacterRepository _characterRepository;

  CharacterResult _characterResponse;
  CharacterDetailBloc(
      this._globalNavigator, this._localRepository, this._characterRepository)
      : super(CharacterDetailState.loading());

  void onStart() => add(CharacterDetailEvent.start());
  void onLocationTapped() => add(CharacterDetailEvent.locationTapped());
  void onEpisodeTapped() => add(CharacterDetailEvent.episodeTapped());
  void onRepeatClicked() => add(CharacterDetailEvent.repeatClicked());

  @override
  Stream<CharacterDetailState> mapEventToState(
    CharacterDetailEvent event,
  ) async* {
    yield* event.when(
        start: _eventStart,
        locationTapped: _eventLocationTapped,
        episodeTapped: _eventEpisodeTapped,
        repeatClicked: _eventRepeatClicked);
  }

  Stream<CharacterDetailState> _eventStart() async* {
    yield* _eventRequest();
  }

  Stream<CharacterDetailState> _eventRequest() async* {
    final id = _localRepository.getId();
    try {
      _characterResponse = await _characterRepository.getCharacterDetail(id);
      if (_characterResponse != null) {
        yield CharacterDetailState.update(result: _characterResponse);
      }
    } on Exception catch (_) {
      yield CharacterDetailState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<CharacterDetailState> _eventLocationTapped() async* {
    _localRepository.saveId(_characterResponse.location.url.splitSlCustom);
    _globalNavigator.pushGlobalPage(LocationDetailPage.routeName);
  }

  Stream<CharacterDetailState> _eventEpisodeTapped() async* {
    final List<int> idEpisodes = [];
    _characterResponse.episode.forEach((element) {
      idEpisodes.add(element.splitSlCustom);
    });
    _localRepository.saveIdEpisods(idEpisodes);
    _globalNavigator.pushGlobalPage(EpisodesPage.routeName);
  }

  Stream<CharacterDetailState> _eventRepeatClicked() async* {
    yield CharacterDetailState.loading();
    yield* _eventRequest();
  }
}
