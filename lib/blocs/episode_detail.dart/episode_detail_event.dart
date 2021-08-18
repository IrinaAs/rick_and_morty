import 'package:super_enum/super_enum.dart';
part 'episode_detail_event.super.dart';

@superEnum
enum _EpisodeDetailEvent {
  @object
  Start,
  @object
  RepeatClicked,
  @object
  CharacterWithEpisodeTapped,
  @object
  ClosedBottomSheet,
  @object
  ItemBottomSheetClicked
}
