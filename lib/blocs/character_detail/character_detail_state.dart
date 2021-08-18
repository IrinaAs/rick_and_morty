import 'package:rick_and_morty_app/data/models/fields/character_result.dart';
import 'package:super_enum/super_enum.dart';
part 'character_detail_state.super.dart';

@superEnum
enum _CharacterDetailState {
  @object
  Loading,
  @Data(fields: [
    DataField<CharacterResult>('result'),
  ])
  Update,
  @Data(fields: [DataField<String>('error')])
  Error
}
