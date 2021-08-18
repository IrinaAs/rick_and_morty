import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:rick_and_morty_app/data/models/fields/episode_result.dart';
import 'package:super_enum/super_enum.dart';
part 'episode_detail_state.super.dart';

@superEnum
enum _EpisodeDetailState {
  @object
  Loading,
  @Data(fields: [
    DataField<EpisodeResult>('episodeResult'),
    DataField<bool>('isOpenedBottomSheet'),
  ])
  Update,
  @Data(fields: [
    DataField<EpisodeDetailState>('previousState'),
    DataField<List<CharacterResult>>('characterDetailResults'),
  ])
  ShowBottomSheet,
  @Data(fields: [DataField<String>('error')])
  Error
}
