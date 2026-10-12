import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nearby_text/src/domain/models/user_data/user_data.dart';
import 'package:nearby_text/src/domain/repositories/database_helper.dart';
import 'package:nearby_text/src/domain/repositories/dio_client.dart';
import 'package:nearby_text/src/presentation/cubits/chat_cubit.dart';
import 'package:nearby_text/src/presentation/cubits/client/client_cubit.dart';
import 'package:nearby_text/src/presentation/cubits/server/server_cubit.dart';
import 'package:nearby_text/src/utils/constants/app_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/router.dart';

final getIt = GetIt.instance;

class AppData {
  late SharedPreferences sp;
  late UserData userData;
  late bool isRegistered;
  final db = DatabaseHelper();
  late DioClient client;
  String? errorMessage;

  bool get hasError => errorMessage != null;

  Future<bool> init({bool register = true}) async {
    client = DioClient();
    await db.init();
    if (register) {
      getIt.registerLazySingleton<ServerCubit>(() => ServerCubit());
      getIt.registerLazySingleton<ClientCubit>(() => ClientCubit());
      getIt.registerLazySingleton<ChatCubit>(() => ChatCubit());
    }
    errorMessage = await client.init();
    sp = await SharedPreferences.getInstance();
    isRegistered = sp.getString(AppDataKeys.userData) != null;
    if (isRegistered) {
      userData = UserData.fromJson(
        jsonDecode(sp.getString(AppDataKeys.userData)!),
      );
    }
    return errorMessage == null;
  }

  onRetry(context) async {
    if (await init(register: false)) {
      Navigator.of(
        context,
      ).pushReplacementNamed(AppRoutes.initialRoute(isRegistered));
    }
  }

  Future<void> saveProfile(UserData userData) async {
    await sp.setString(AppDataKeys.userData, jsonEncode(userData.toJson()));
    this.userData = userData;
  }
}
