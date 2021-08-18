import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/data/models/fields/episode_result.dart';
import 'package:rick_and_morty_app/data/repository/character_repository.dart';
import 'package:rick_and_morty_app/data/repository/episode_repository.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/navigation/core/navigation_controller.dart';
import 'package:rick_and_morty_app/ui/page/character_detail_page.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/widgets/bottom_sheet.dart';
import 'package:rick_and_morty_app/ui/utils/string_ext.dart';
import './bloc.dart';

class EpisodeDetailBloc extends Bloc<EpisodeDetailEvent, EpisodeDetailState> {
  EpisodeDetailBloc(this._globalNavigator, this._localRepository,
      this._episodeRepository, this._characterRepository)
      : super(EpisodeDetailState.loading());

  final GlobalNavigator _globalNavigator;
  final LocalRepository _localRepository;
  final EpisodeRepository _episodeRepository;
  final CharacterRepository _characterRepository;
  List<CharacterResult> _charactersDetailResults = [];

  EpisodeResult _episodeResponse;

  void onStart() => add(EpisodeDetailEvent.start());
  void onCharactersWithEpisodeTapped() =>
      add(EpisodeDetailEvent.characterWithEpisodeTapped());
  void onItemBottomSheetClicked() =>
      add(EpisodeDetailEvent.itemBottomSheetClicked());
  void onRepeatClicked() => add(EpisodeDetailEvent.repeatClicked());
  void onClosedBottomSheet() => add(EpisodeDetailEvent.closedBottomSheet());

  @override
  Stream<EpisodeDetailState> mapEventToState(
    EpisodeDetailEvent event,
  ) async* {
    yield* event.when(
        start: _eventStart,
        repeatClicked: _eventRepeatClicked,
        characterWithEpisodeTapped: _eventCharactersWithEpisodeTapped,
        closedBottomSheet: _eventClosedBottomSheet,
        itemBottomSheetClicked: _eventItemBottomSheetClicked);
  }

  Stream<EpisodeDetailState> _eventStart() async* {
    yield* _eventRequest();

    yield EpisodeDetailState.update(
      episodeResult: _episodeResponse,
      isOpenedBottomSheet: false,
    );
  }

  Stream<EpisodeDetailState> _eventRequest() async* {
    final id = _localRepository.getId();
    try {
      EpisodeResult _episodeResponse =
          await _episodeRepository.getEpicodeDetail(id);
      if (_episodeResponse != null) {
        this._episodeResponse = _episodeResponse;
      }
    } on Exception catch (_) {
      yield EpisodeDetailState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<EpisodeDetailState> _eventCharactersWithEpisodeTapped() async* {
    if (_charactersDetailResults.isEmpty) {
      yield EpisodeDetailState.update(
        episodeResult: _episodeResponse,
        isOpenedBottomSheet: true,
      );

      for (var i = 0; i < this._episodeResponse.characters.length; i++) {
        final id = this._episodeResponse.characters[i].splitSlCustom;

        try {
          CharacterResult _characterResponse =
              await _characterRepository.getCharacterDetail(id);
          if (_characterResponse != null) {
            _charactersDetailResults.add(_characterResponse);
          }
        } on Exception catch (_) {
          yield EpisodeDetailState.error(error: ERROR_TEXT_FULL);
        }
      }
    }
    yield EpisodeDetailState.showBottomSheet(
        previousState: EpisodeDetailState.update(
          episodeResult: _episodeResponse,
          isOpenedBottomSheet: false,
        ),
        characterDetailResults: _charactersDetailResults);
  }

  Stream<EpisodeDetailState> _eventClosedBottomSheet() async* {
    yield EpisodeDetailState.update(
      episodeResult: _episodeResponse,
      isOpenedBottomSheet: false,
    );
  }

  Stream<EpisodeDetailState> _eventItemBottomSheetClicked() async* {
    final id = _charactersDetailResults[BottomSheetCustom.idCharacter]
        .url
        .splitSlCustom;
    _localRepository.saveId(id);
    _globalNavigator.pushGlobalPage(CharacterDetailPage.routeName);
  }

  Stream<EpisodeDetailState> _eventRepeatClicked() async* {
    yield EpisodeDetailState.loading();
    yield* _eventRequest();
  }
}
