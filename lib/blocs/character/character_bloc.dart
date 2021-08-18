import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/data/models/fields/info.dart';
import 'package:rick_and_morty_app/data/models/response/characters_response.dart';
import 'package:rick_and_morty_app/data/repository/character_repository.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/navigation/core/navigation_controller.dart';
import 'package:rick_and_morty_app/ui/page/character_detail_page.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/utils/string_ext.dart';
import './bloc.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GlobalNavigator _globalNavigator;
  final List<CharacterResult> _characters = [];
  final CharacterRepository _characterRepository;
  final LocalRepository _localRepository;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  CharactersResponse _characterResponse;
  Info _info = Info(count: 0, pages: 0, next: '', prev: '');

  CharacterBloc(
      this._characterRepository, this._globalNavigator, this._localRepository)
      : super(CharacterState.loading());

  CharacterState get _getUpdateLoaded => state is Loaded
      ? CharacterState.update(
          info: _info,
          result: _characters,
          refreshController: _easyRefreshController,
        )
      : CharacterState.loaded(
          info: _info,
          result: _characters,
          refreshController: _easyRefreshController);

  void onStart() => add(CharacterEvent.start());
  void onItemTapped(int id) => add(CharacterEvent.itemClicked(index: id));
  void onPageFetch() => add(CharacterEvent.pagination());
  void onRefresh() => add(CharacterEvent.refresh());
  void onRepeatClicked() => add(CharacterEvent.repeatClicked());

  @override
  Stream<CharacterState> mapEventToState(
    CharacterEvent event,
  ) async* {
    yield* event.when(
        start: _eventStart,
        itemClicked: _eventItemClicked,
        refresh: _eventRefresh,
        pagination: _eventPagination,
        repeatClicked: _eventRepeatClicked);
  }

  Stream<CharacterState> _eventStart() async* {
    yield* _eventRequest();
  }

  Stream<CharacterState> _eventRefresh() async* {
    _characters.clear();
    yield* _eventRequest();
    _easyRefreshController.finishRefresh();
  }

  Stream<CharacterState> _eventRequest() async* {
    try {
      _characterResponse = await _characterRepository.getCharacters();
      if (_characterResponse != null) {
        _info = _characterResponse.info;
        _characters.addAll(_characterResponse.results);
        yield _getUpdateLoaded;
      }
    } on Exception catch (_) {
      yield CharacterState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<CharacterState> _eventItemClicked(ItemClicked e) async* {
    _localRepository.saveId(e.index);
    _globalNavigator.pushGlobalPage(CharacterDetailPage.routeName);
  }

  Stream<CharacterState> _eventPagination() async* {
    final nextPage = _characterResponse.info.next.splitEqCustom;

    try {
      _characterResponse =
          await _characterRepository.getCharacters(page: nextPage);
      if (_characterResponse != null) {
        _characters.addAll(_characterResponse.results);
        _easyRefreshController.finishLoad(noMore: false);
        yield _getUpdateLoaded;
      }
    } on Exception catch (_) {
      yield CharacterState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<CharacterState> _eventRepeatClicked() async* {
    yield CharacterState.loading();
    yield* _eventRequest();
  }
}
