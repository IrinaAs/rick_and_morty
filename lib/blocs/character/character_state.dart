import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/data/models/fields/info.dart';
import 'package:super_enum/super_enum.dart';
part 'character_state.super.dart';

@superEnum
enum _CharacterState {
  @object
  Loading,
  @Data(fields: [
    DataField<Info>('info'),
    DataField<List<CharacterResult>>('result'),
    DataField<EasyRefreshController>('refreshController')
  ])
  Loaded,
  @Data(fields: [
    DataField<Info>('info'),
    DataField<List<CharacterResult>>('result'),
    DataField<EasyRefreshController>('refreshController')
  ])
  Update,
  @Data(fields: [DataField<String>('error')])
  Error
}
