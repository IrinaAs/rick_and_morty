import 'package:super_enum/super_enum.dart';
part 'character_detail_event.super.dart';

@superEnum
enum _CharacterDetailEvent {
  @object
  Start,
  @object
  LocationTapped,
  @object
  EpisodeTapped,
  @object
  RepeatClicked
}
