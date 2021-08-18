import 'package:super_enum/super_enum.dart';
part 'location_detail_event.super.dart';

@superEnum
enum _LocationDetailEvent {
  @object
  Start,
  @object
  RepeatClicked,
  @object
  CharacterWithLocationTapped
}
