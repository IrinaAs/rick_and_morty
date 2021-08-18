import 'package:rick_and_morty_app/data/models/fields/episode_result.dart';
import 'package:super_enum/super_enum.dart';
part 'episode_state.super.dart';

@superEnum
enum _EpisodeState {
  @object
  Loading,
  @Data(fields: [
    DataField<List<EpisodeResult>>('result'),
  ])
  Update,
  @Data(fields: [DataField<String>('error')])
  Error
}
