import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:rick_and_morty_app/data/models/fields/location_result.dart';
import 'package:rick_and_morty_app/data/repository/local_repository.dart';
import 'package:rick_and_morty_app/data/repository/location_repository.dart';
import 'package:rick_and_morty_app/ui/utils/const_value.dart';
import './bloc.dart';

class LocationDetailBloc
    extends Bloc<LocationDetailEvent, LocationDetailState> {
  LocationDetailBloc(this._localRepository, this._locationRepository)
      : super(LocationDetailState.loading());

  final LocalRepository _localRepository;
  final LocationRepository _locationRepository;

  void onStart() => add(LocationDetailEvent.start());
  void onCharactersWithLocationTapped() =>
      add(LocationDetailEvent.characterWithLocationTapped());

  void onRepeatClicked() => add(LocationDetailEvent.repeatClicked());

  @override
  Stream<LocationDetailState> mapEventToState(
    LocationDetailEvent event,
  ) async* {
    yield* event.when(
        start: _eventStart,
        repeatClicked: _eventRepeatClicked,
        characterWithLocationTapped: _eventCharactersWithLocationTapped);
  }

  Stream<LocationDetailState> _eventStart() async* {
    yield* _eventRequest();
  }

  Stream<LocationDetailState> _eventRequest() async* {
    final id = _localRepository.getId();
    try {
      LocationResult _locationResponse =
          await _locationRepository.getLocationDetail(id);
      if (_locationResponse != null) {
        yield LocationDetailState.update(result: _locationResponse);
      }
    } on Exception catch (_) {
      yield LocationDetailState.error(error: ERROR_TEXT_FULL);
    }
  }

  Stream<LocationDetailState> _eventCharactersWithLocationTapped() async* {}

  Stream<LocationDetailState> _eventRepeatClicked() async* {
    yield LocationDetailState.loading();
    yield* _eventRequest();
  }
}
