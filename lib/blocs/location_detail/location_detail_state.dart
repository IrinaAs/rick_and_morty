import 'package:rick_and_morty_app/data/models/fields/location_result.dart';
import 'package:super_enum/super_enum.dart';
part 'location_detail_state.super.dart';

@superEnum
enum _LocationDetailState {
  @object
  Loading,
  @Data(fields: [
    DataField<LocationResult>('result'),
  ])
  Update,
  @Data(fields: [DataField<String>('error')])
  Error
}
