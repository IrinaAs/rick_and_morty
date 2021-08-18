import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/data/models/fields/episode_result.dart';
import 'package:rick_and_morty_app/data/models/fields/info.dart';
import 'package:rick_and_morty_app/data/models/response/episodes_response.dart';
import 'package:rick_and_morty_app/data/repository/episode_repository.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/navigation/core/navigation_controller.dart';
import 'package:rick_and_morty_app/ui/page/episode_detail_page.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/utils/string_ext.dart';
import './bloc.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final GlobalNavigator _globalNavigator;
  final List<EpisodeResult> _episodes = [];
  final EpisodeRepository _episodeRepository;
  final LocalRepository _localRepository;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  EpisodesResponse _episodesResponse;
  Info _info = Info(count: 0, pages: 0, next: '', prev: '');

  EpisodeBloc(
      this._globalNavigator, this._episodeRepository, this._localRepository)
      : super(EpisodeState.loading());

  EpisodeState get _getUpdateLoaded => state is Loaded
      ? EpisodeState.update(
          info: _info,
          result: _episodes,
          refreshController: _easyRefreshController,
        )
      : EpisodeState.loaded(
          info: _info,
          result: _episodes,
          refreshController: _easyRefreshController);

  void onStart() => add(EpisodeEvent.start());
  void onItemTapped(int id) => add(EpisodeEvent.itemClicked(index: id));
  void onPageFetch() => add(EpisodeEvent.pagination());
  void onRefresh() => add(EpisodeEvent.refresh());
  void onRepeatClicked() => add(EpisodeEvent.repeatClicked());

  @override
  Stream<EpisodeState> mapEventToState(
    EpisodeEvent event,
  ) async* {
    yield* event.when(
      start: _eventStart,
      itemClicked: _eventItemClicked,
      pagination: _eventPagination,
      refresh: _eventRefresh,
      repeatClicked: _eventRepeatClicked,
    );
  }

  Stream<EpisodeState> _eventStart() async* {
    yield* _eventRequest();
  }

  Stream<EpisodeState> _eventRequest() async* {
    try {
      _episodesResponse = await _episodeRepository.getEpicodes();
      if (_episodesResponse != null) {
        _info = _episodesResponse.info;
        _episodes.addAll(_episodesResponse.results);
        yield _getUpdateLoaded;
      }
    } on Exception catch (_) {
      yield EpisodeState.error(error: '');
    }
  }

  Stream<EpisodeState> _eventRefresh() async* {
    _episodes.clear();
    yield* _eventRequest();
    _easyRefreshController.finishRefresh();
  }

  Stream<EpisodeState> _eventItemClicked(ItemClicked e) async* {
    _localRepository.saveId(e.index);
    _globalNavigator.pushGlobalPage(EpisodeDetailPage.routeName);
  }

  Stream<EpisodeState> _eventPagination() async* {
    final nextPage = _episodesResponse.info.next.splitEqCustom;
    try {
      _episodesResponse = await _episodeRepository.getEpicodes(page: nextPage);
      if (_episodesResponse != null) {
        _episodes.addAll(_episodesResponse.results);
        _easyRefreshController.finishLoad(noMore: false);
        yield _getUpdateLoaded;
      }
    } on Exception catch (_) {
      yield EpisodeState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<EpisodeState> _eventRepeatClicked() async* {
    yield EpisodeState.loading();
    yield* _eventRequest();
  }
}
