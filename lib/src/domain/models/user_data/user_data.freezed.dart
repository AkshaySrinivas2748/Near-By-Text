// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserData {

@JsonKey(name: 'name') String get name;@JsonKey(name: 'uid') String get uid;@JsonKey(name: 'showDateSnackBar') bool get showDateSnackBar;@JsonKey(name: 'dob')@TimestampSerializer() DateTime? get dob;
/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataCopyWith<UserData> get copyWith => _$UserDataCopyWithImpl<UserData>(this as UserData, _$identity);

  /// Serializes this UserData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserData&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.showDateSnackBar, showDateSnackBar) || other.showDateSnackBar == showDateSnackBar)&&(identical(other.dob, dob) || other.dob == dob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,showDateSnackBar,dob);

@override
String toString() {
  return 'UserData(name: $name, uid: $uid, showDateSnackBar: $showDateSnackBar, dob: $dob)';
}


}

/// @nodoc
abstract mixin class $UserDataCopyWith<$Res>  {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) _then) = _$UserDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'showDateSnackBar') bool showDateSnackBar,@JsonKey(name: 'dob')@TimestampSerializer() DateTime? dob
});




}
/// @nodoc
class _$UserDataCopyWithImpl<$Res>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._self, this._then);

  final UserData _self;
  final $Res Function(UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? uid = null,Object? showDateSnackBar = null,Object? dob = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,showDateSnackBar: null == showDateSnackBar ? _self.showDateSnackBar : showDateSnackBar // ignore: cast_nullable_to_non_nullable
as bool,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UserData implements UserData {
   _UserData({@JsonKey(name: 'name') required this.name, @JsonKey(name: 'uid') required this.uid, @JsonKey(name: 'showDateSnackBar') this.showDateSnackBar = false, @JsonKey(name: 'dob')@TimestampSerializer() this.dob});
  factory _UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'uid') final  String uid;
@override@JsonKey(name: 'showDateSnackBar') final  bool showDateSnackBar;
@override@JsonKey(name: 'dob')@TimestampSerializer() final  DateTime? dob;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataCopyWith<_UserData> get copyWith => __$UserDataCopyWithImpl<_UserData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserData&&(identical(other.name, name) || other.name == name)&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.showDateSnackBar, showDateSnackBar) || other.showDateSnackBar == showDateSnackBar)&&(identical(other.dob, dob) || other.dob == dob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,uid,showDateSnackBar,dob);

@override
String toString() {
  return 'UserData(name: $name, uid: $uid, showDateSnackBar: $showDateSnackBar, dob: $dob)';
}


}

/// @nodoc
abstract mixin class _$UserDataCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$UserDataCopyWith(_UserData value, $Res Function(_UserData) _then) = __$UserDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'uid') String uid,@JsonKey(name: 'showDateSnackBar') bool showDateSnackBar,@JsonKey(name: 'dob')@TimestampSerializer() DateTime? dob
});




}
/// @nodoc
class __$UserDataCopyWithImpl<$Res>
    implements _$UserDataCopyWith<$Res> {
  __$UserDataCopyWithImpl(this._self, this._then);

  final _UserData _self;
  final $Res Function(_UserData) _then;

/// Create a copy of UserData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? uid = null,Object? showDateSnackBar = null,Object? dob = freezed,}) {
  return _then(_UserData(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,showDateSnackBar: null == showDateSnackBar ? _self.showDateSnackBar : showDateSnackBar // ignore: cast_nullable_to_non_nullable
as bool,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
