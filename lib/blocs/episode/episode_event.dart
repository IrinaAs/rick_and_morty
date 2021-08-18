import 'package:super_enum/super_enum.dart';
part 'episode_event.super.dart';

@superEnum
enum _EpisodeEvent {
  @object
  Start,
  @Data(fields: [DataField<int>('index')])
  ItemClicked,
  @object
  Pagination,
  @object
  Refresh,
  @object
  RepeatClicked,
}
