import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_text/src/domain/models/user_data/user_data.dart';
import 'package:nearby_text/src/utils/extensions/date_time_extensions.dart';

import '../../../main.dart';

class RegisterCubit extends Cubit<UserData?> {
  RegisterCubit() : super(null);
  final formKey = GlobalKey<FormState>();

  Future<bool> register(String name) async {
    if (formKey.currentState?.validate() != true) {
      return false;
    } else if (state?.dob == null) {
      update(showDateSnackBar: true);
      return false;
    } else {
      appData.saveProfile(
        state!.copyWith(
          name: name,
          uid: '$name-${state!.dob!.ddMmmmYYYY}',
          showDateSnackBar: false,
        ),
      );
      return true;
    }
  }

  Future<void> update({
    String? name,
    String? uid,
    DateTime? dob,
    bool showDateSnackBar = false,
  }) async {
    if (showDateSnackBar == false &&
        name == null &&
        uid == null &&
        dob == null) {
      emit(null);
    } else {
      emit(
        UserData(
          name: name ?? state?.name ?? '',
          uid: uid ?? state?.uid ?? '',
          dob: dob ?? state?.dob,
          showDateSnackBar: showDateSnackBar,
        ),
      );
    }
  }
}
