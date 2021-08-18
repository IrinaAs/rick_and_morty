import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/data/repository/character_repository.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/navigation/core/navigation_controller.dart';
import 'package:rick_and_morty_app/ui/page/episodes_page.dart';
import 'package:rick_and_morty_app/ui/page/locations_page.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import './bloc.dart';

class CharacterDetailBloc
    extends Bloc<CharacterDetailEvent, CharacterDetailState> {
  final GlobalNavigator _globalNavigator;
  final LocalRepository _localRepository;
  final CharacterRepository _characterRepository;
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
      CharacterResult _characterResponse =
          await _characterRepository.getCharacterDetail(id);
      if (_characterResponse != null) {
        yield CharacterDetailState.update(result: _characterResponse);
      }
    } on Exception catch (_) {
      yield CharacterDetailState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<CharacterDetailState> _eventLocationTapped() async* {
    _globalNavigator.pushGlobalPage(LocationsPage.routeName);
  }

  Stream<CharacterDetailState> _eventEpisodeTapped() async* {
    _globalNavigator.pushGlobalPage(EpisodesPage.routeName);
  }

  Stream<CharacterDetailState> _eventRepeatClicked() async* {
    yield CharacterDetailState.loading();
    yield* _eventRequest();
  }
}
