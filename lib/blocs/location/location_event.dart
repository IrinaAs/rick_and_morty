import 'package:super_enum/super_enum.dart';
part 'location_event.super.dart';

@superEnum
enum _LocationEvent {
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
