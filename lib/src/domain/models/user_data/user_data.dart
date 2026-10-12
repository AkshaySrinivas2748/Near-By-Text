import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/serializers/date_time_serializer.dart';

part 'user_data.freezed.dart';

part 'user_data.g.dart';

@freezed
abstract class UserData with _$UserData {
  factory UserData({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'uid') required String uid,
    @JsonKey(name: 'showDateSnackBar') @Default(false) bool showDateSnackBar,
    @JsonKey(name: 'dob') @TimestampSerializer() DateTime? dob,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
