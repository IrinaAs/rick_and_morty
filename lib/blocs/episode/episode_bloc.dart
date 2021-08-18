import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/data/models/fields/episode_result.dart';
import 'package:rick_and_morty_app/data/repository/episode_repository.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/navigation/core/navigation_controller.dart';
import 'package:rick_and_morty_app/ui/page/episode_detail_page.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import './bloc.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GlobalNavigator _globalNavigator;
  final List<EpisodeResult> _episodes = [];
  final EpisodeRepository _episodeRepository;
  final LocalRepository _localRepository;

  EpisodeBloc(
      this._globalNavigator, this._episodeRepository, this._localRepository)
      : super(EpisodeState.loading());

  void onStart() => add(EpisodeEvent.start());
  void onItemTapped(int id) => add(EpisodeEvent.itemClicked(index: id));
  void onRepeatClicked() => add(EpisodeEvent.repeatClicked());

  @override
  Stream<EpisodeState> mapEventToState(
    EpisodeEvent event,
  ) async* {
    yield* event.when(
      start: _eventStart,
      itemClicked: _eventItemClicked,
      repeatClicked: _eventRepeatClicked,
    );
  }

  Stream<EpisodeState> _eventStart() async* {
    yield* _eventRequest();
  }

  Stream<EpisodeState> _eventRequest() async* {
    final idEpisodes = _localRepository.getIdEpisods();
    for (var i = 0; i < idEpisodes.length; i++) {
      try {
        final EpisodeResult episodesResponse =
            await _episodeRepository.getEpicodeDetail(idEpisodes[i]);
        if (episodesResponse != null) {
          _episodes.add(episodesResponse);
        }
      } on Exception catch (_) {
        yield EpisodeState.error(error: ERROR_TEXT_FULL);
      }
    }
    yield EpisodeState.update(result: _episodes);
  }

  Stream<EpisodeState> _eventItemClicked(ItemClicked e) async* {
    _localRepository.saveId(e.index);
    _globalNavigator.pushGlobalPage(EpisodeDetailPage.routeName);
  }

  Stream<EpisodeState> _eventRepeatClicked() async* {
    yield EpisodeState.loading();
    yield* _eventRequest();
  }
}
