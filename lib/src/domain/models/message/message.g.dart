// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Message _$MessageFromJson(Map<String, dynamic> json) => _Message(
  clientUID: json['client_uid'] as String,
  content: json['content'] as String?,
  dateTime: const TimestampSerializer().fromJson(json['dateTime']),
  uid: json['uid'] as String,
  msgType: json['message_type'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$MessageToJson(_Message instance) => <String, dynamic>{
  'client_uid': instance.clientUID,
  'content': instance.content,
  'dateTime': const TimestampSerializer().toJson(instance.dateTime),
  'uid': instance.uid,
  'message_type': instance.msgType,
  'name': instance.name,
};
