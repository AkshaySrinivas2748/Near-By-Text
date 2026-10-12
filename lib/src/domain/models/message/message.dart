import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/serializers/date_time_serializer.dart';

part 'message.freezed.dart';

part 'message.g.dart';

@freezed
abstract class Message with _$Message {
  factory Message({
    @JsonKey(name: 'client_uid') required String clientUID,
    @JsonKey(name: 'content') required String? content,
    @JsonKey(name: 'dateTime') @TimestampSerializer() required DateTime dateTime,
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'message_type') required String msgType,
    @JsonKey(name: 'name') required String name,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}
