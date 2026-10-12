// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserData _$UserDataFromJson(Map<String, dynamic> json) => _UserData(
  name: json['name'] as String,
  uid: json['uid'] as String,
  showDateSnackBar: json['showDateSnackBar'] as bool? ?? false,
  dob: const TimestampSerializer().fromJson(json['dob']),
);

Map<String, dynamic> _$UserDataToJson(_UserData instance) => <String, dynamic>{
  'name': instance.name,
  'uid': instance.uid,
  'showDateSnackBar': instance.showDateSnackBar,
  'dob': _$JsonConverterToJson<dynamic, DateTime>(
    instance.dob,
    const TimestampSerializer().toJson,
  ),
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
