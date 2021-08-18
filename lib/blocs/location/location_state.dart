import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/data/models/fields/info.dart';
import 'package:rick_and_morty_app/data/models/fields/location_result.dart';
import 'package:super_enum/super_enum.dart';
part 'location_state.super.dart';

@superEnum
enum _LocationState {
  @object
  Loading,
  @Data(fields: [
    DataField<Info>('info'),
    DataField<List<LocationResult>>('result'),
    DataField<EasyRefreshController>('refreshController')
  ])
  Loaded,
  @Data(fields: [
    DataField<Info>('info'),
    DataField<List<LocationResult>>('result'),
    DataField<EasyRefreshController>('refreshController')
  ])
  Update,
  @Data(fields: [DataField<String>('error')])
  Error
}
