import 'dart:convert';
import 'package:rick_and_morty_app/data/datasource/api/api.dart';
import 'package:rick_and_morty_app/data/models/fields/location_result.dart';
import 'package:rick_and_morty_app/data/models/response/locations_response.dart';

abstract class LocationRepository {
  Future<LocationsResponse> getLocations({int page = 1});
  Future<LocationResult> getLocationDetail(int id);
}

class LocationRepositoryImpl implements LocationRepository {
  static LocationRepository _locationRepository;
  Api _api;

  LocationRepositoryImpl._() {
    this._api = Api.create();
  }
  static LocationRepository instance() =>
      _locationRepository = _locationRepository ?? LocationRepositoryImpl._();

  @override
  Future<LocationsResponse> getLocations({int page = 1}) async {
    final response = await _api.locations(page);
    return LocationsResponse.fromJson(jsonDecode(response.body));
  }

  @override
  Future<LocationResult> getLocationDetail(int id) async {
    final response = await _api.locationDetail(id);
    return LocationResult.fromJson(jsonDecode(response.body));
  }
}
