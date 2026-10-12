import 'package:flutter/material.dart';
import 'package:nearby_text/main.dart';
import 'package:nearby_text/src/presentation/views/chat_view.dart';
import 'package:nearby_text/src/presentation/views/chatlist_view.dart';
import 'package:nearby_text/src/presentation/views/connect_view.dart';
import 'package:nearby_text/src/presentation/views/error_view.dart';
import 'package:nearby_text/src/presentation/views/host_view.dart';
import 'package:nearby_text/src/presentation/views/home_view.dart';
import 'package:nearby_text/src/utils/constants/enums.dart';

import '../presentation/views/register_view.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    error: (context) => ErrorView(),
    home: (context) => HomeView(),
    chatAsHost: (context) => ChatView(state: ChatViewState.host),
    chatList: (context) => ChatListView(),
    register: (context) => RegisterView(),
    hostView: (context) => HostView(),
    clientConnectView: (context) => ClientView(),
    chatAsClient: (context) => ChatView(state: ChatViewState.client),
  };
  static const String error = '/error';
  static const String home = '/home';
  static const String chatList = '/chat_list';
  static const String chatAsHost = '/chat_as_host';
  static const String register = '/register';
  static const String hostView = '/host_view';
  static const String clientConnectView = '/client_connect_view';
  static const String chatAsClient = '/chat_as_client';

  static String initialRoute(bool registered) =>
      appData.hasError
          ? error
          : !registered
          ? register
          : home;
}
