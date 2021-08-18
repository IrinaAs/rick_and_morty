import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/data/models/fields/info.dart';
import 'package:rick_and_morty_app/data/models/fields/location_result.dart';
import 'package:rick_and_morty_app/data/models/response/locations_response.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/data/repository/location_repository.dart';
import 'package:rick_and_morty_app/navigation/core/navigation_controller.dart';
import 'package:rick_and_morty_app/ui/page/location_detail_page.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import 'package:rick_and_morty_app/ui/utils/string_ext.dart';
import './bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(
      this._globalNavigator, this._locationRepository, this._localRepository)
      : super(LocationState.loading());

  final GlobalNavigator _globalNavigator;
  final List<LocationResult> _locations = [];
  final LocationRepository _locationRepository;
  final LocalRepository _localRepository;
  final EasyRefreshController _easyRefreshController = EasyRefreshController();

  LocationsResponse _locationResponse;
  Info _info = Info(count: 0, pages: 0, next: '', prev: '');

  LocationState get _getUpdateLoaded => state is Loaded
      ? LocationState.update(
          info: _info,
          result: _locations,
          refreshController: _easyRefreshController,
        )
      : LocationState.loaded(
          info: _info,
          result: _locations,
          refreshController: _easyRefreshController);

  void onStart() => add(LocationEvent.start());
  void onItemTapped(int id) => add(LocationEvent.itemClicked(index: id));
  void onPageFetch() => add(LocationEvent.pagination());
  void onRefresh() => add(LocationEvent.refresh());
  void onRepeatClicked() => add(LocationEvent.repeatClicked());

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    yield* event.when(
        start: _eventStart,
        itemClicked: _eventItemClicked,
        pagination: _eventPagination,
        refresh: _eventRefresh,
        repeatClicked: _eventRepeatClicked);
  }

  Stream<LocationState> _eventStart() async* {
    yield* _eventRequest();
  }

  Stream<LocationState> _eventRequest() async* {
    try {
      _locationResponse = await _locationRepository.getLocations();
      if (_locationResponse != null) {
        _info = _locationResponse.info;
        _locations.addAll(_locationResponse.results);
        yield _getUpdateLoaded;
      }
    } on Exception catch (_) {
      yield LocationState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<LocationState> _eventRefresh() async* {
    _locations.clear();
    yield* _eventRequest();
    _easyRefreshController.finishRefresh();
  }

  Stream<LocationState> _eventItemClicked(ItemClicked e) async* {
    _localRepository.saveId(e.index);
    _globalNavigator.pushGlobalPage(LocationDetailPage.routeName);
  }

  Stream<LocationState> _eventPagination() async* {
    final nextPage = _locationResponse.info.next.splitEqCustom;
    try {
      _locationResponse =
          await _locationRepository.getLocations(page: nextPage);
      if (_locationResponse != null) {
        _locations.addAll(_locationResponse.results);
        _easyRefreshController.finishLoad(noMore: false);
        yield _getUpdateLoaded;
      }
    } on Exception catch (_) {
      yield LocationState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<LocationState> _eventRepeatClicked() async* {
    yield LocationState.loading();
    yield* _eventRequest();
  }
}
