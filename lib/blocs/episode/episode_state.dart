import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:rick_and_morty_app/data/models/fields/episode_result.dart';
import 'package:rick_and_morty_app/data/models/fields/info.dart';
import 'package:super_enum/super_enum.dart';
part 'episode_state.super.dart';

@superEnum
enum _EpisodeState {
  @object
  Loading,
  @Data(fields: [
    DataField<Info>('info'),
    DataField<List<EpisodeResult>>('result'),
    DataField<EasyRefreshController>('refreshController')
  ])
  Loaded,
  @Data(fields: [
    DataField<Info>('info'),
    DataField<List<EpisodeResult>>('result'),
    DataField<EasyRefreshController>('refreshController')
  ])
  Update,
  @Data(fields: [DataField<String>('error')])
  Error
}
