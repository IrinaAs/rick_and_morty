import 'package:super_enum/super_enum.dart';
part 'character_event.super.dart';

@superEnum
enum _CharacterEvent {
  @object
  Start,
  @Data(fields: [DataField<int>('index')])
  ItemClicked,
  @object
  Pagination,
  @object
  Refresh,
  @object
  RepeatClicked
}
