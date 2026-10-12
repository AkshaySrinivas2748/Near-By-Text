import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:nearby_text/main.dart';
import 'package:nearby_text/src/domain/models/message/message.dart';
import 'package:nearby_text/src/domain/repositories/app_data.dart';
import 'package:nearby_text/src/presentation/cubits/client/client_cubit.dart';
import 'package:nearby_text/src/presentation/cubits/server/route_handler.dart';

class DioClient {
  late Dio _dio;
  late WebSocket socket;
  late String baseServerUrl;
  late String baseSocketUrl;
  late String ip;

  Future<String?> init({String? url}) async {
    ip = url ?? await _getLocalIpAddress();
    if (ip.isEmpty) {
      return 'Please coonect to WiFi Or turn on hotspot';
    }
    baseServerUrl = 'http://$ip$serverPort';
    baseSocketUrl = 'ws://$ip$socketPort';
    _dio = Dio(BaseOptions(baseUrl: baseServerUrl));
    return null;
  }

  Future<List<Message>> joinNetwork() async {
    socket = await WebSocket.connect(baseSocketUrl);
    socket.add(appData.userData.uid);
    socket.listen((onData) {
      getIt<ClientCubit>().receiveMessage(Message.fromJson(jsonDecode(onData)));
    });
    final response = await _dio.post(
      RouteHandler.joinNetworkPath,
      data: appData.userData.toJson(),
    );
    try {
      final msgs =
          (response.data['Data'] as List<dynamic>)
              .map((e) => Message.fromJson(e))
              .toList();
      return msgs;
    } catch (e) {
      return [];
    }
  }

  Future<void> sendMessage(Message msg) async {
    await _dio.post(RouteHandler.sendMessage, data: msg.toJson());
  }

  Future<String> _getLocalIpAddress() async {
    final interfaces = await NetworkInterface.list(
      type: InternetAddressType.IPv4,
      includeLinkLocal: true,
    );

    try {
      // Try VPN connection first
      NetworkInterface vpnInterface = interfaces.firstWhere(
        (element) => element.name == "tun0",
      );
      return vpnInterface.addresses.first.address;
    } on StateError {
      // Try wlan connection next
      try {
        NetworkInterface interface = interfaces.firstWhere(
          (element) => element.name == "wlan0",
        );
        return interface.addresses.first.address;
      } catch (ex) {
        // Try any other connection next
        try {
          NetworkInterface interface = interfaces.firstWhere(
            (element) => !(element.name == "tun0" || element.name == "wlan0"),
          );
          return interface.addresses.first.address;
        } catch (ex) {
          return '';
        }
      }
    }
  }
}
