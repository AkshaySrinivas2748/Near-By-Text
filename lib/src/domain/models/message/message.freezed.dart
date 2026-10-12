// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {

@JsonKey(name: 'client_uid') String get clientUID;@JsonKey(name: 'content') String? get content;@JsonKey(name: 'dateTime')@TimestampSerializer() DateTime get dateTime;@JsonKey(name: 'uid') String get uid;@JsonKey(name: 'message_type') String get msgType;@JsonKey(name: 'name') String get name;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.clientUID, clientUID) || other.clientUID == clientUID)&&(identical(other.content, content) || other.content == content)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.msgType, msgType) || other.msgType == msgType)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientUID,content,dateTime,uid,msgType,name);

@override
String toString() {
  return 'Message(clientUID: $clientUID, content: $content, dateTime: $dateTime, uid: $uid, msgType: $msgType, name: $name)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'client_uid') String clientUID,@JsonKey(name: 'content') String? content,@JsonKey(name: 'dateTime')@TimestampSerializer() DateTime dateTime,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'message_type') String msgType,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientUID = null,Object? content = freezed,Object? dateTime = null,Object? uid = null,Object? msgType = null,Object? name = null,}) {
  return _then(_self.copyWith(
clientUID: null == clientUID ? _self.clientUID : clientUID // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,msgType: null == msgType ? _self.msgType : msgType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Message implements Message {
   _Message({@JsonKey(name: 'client_uid') required this.clientUID, @JsonKey(name: 'content') required this.content, @JsonKey(name: 'dateTime')@TimestampSerializer() required this.dateTime, @JsonKey(name: 'uid') required this.uid, @JsonKey(name: 'message_type') required this.msgType, @JsonKey(name: 'name') required this.name});
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override@JsonKey(name: 'client_uid') final  String clientUID;
@override@JsonKey(name: 'content') final  String? content;
@override@JsonKey(name: 'dateTime')@TimestampSerializer() final  DateTime dateTime;
@override@JsonKey(name: 'uid') final  String uid;
@override@JsonKey(name: 'message_type') final  String msgType;
@override@JsonKey(name: 'name') final  String name;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.clientUID, clientUID) || other.clientUID == clientUID)&&(identical(other.content, content) || other.content == content)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.msgType, msgType) || other.msgType == msgType)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientUID,content,dateTime,uid,msgType,name);

@override
String toString() {
  return 'Message(clientUID: $clientUID, content: $content, dateTime: $dateTime, uid: $uid, msgType: $msgType, name: $name)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'client_uid') String clientUID,@JsonKey(name: 'content') String? content,@JsonKey(name: 'dateTime')@TimestampSerializer() DateTime dateTime,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'message_type') String msgType,@JsonKey(name: 'name') String name
});




}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientUID = null,Object? content = freezed,Object? dateTime = null,Object? uid = null,Object? msgType = null,Object? name = null,}) {
  return _then(_Message(
clientUID: null == clientUID ? _self.clientUID : clientUID // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,dateTime: null == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as DateTime,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,msgType: null == msgType ? _self.msgType : msgType // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
