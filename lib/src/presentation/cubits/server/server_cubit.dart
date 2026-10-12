import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_text/src/domain/models/message/message.dart';
import 'package:nearby_text/src/domain/models/user_data/user_data.dart';
import 'package:nearby_text/src/presentation/cubits/server/route_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../../main.dart';

class ServerCubit extends Cubit<ServerState> {
  ServerCubit() : super(LoadingServerState());

  List<Message> msgs = [];
  Map<String, WebSocketChannel> clients = <String, WebSocketChannel>{};

  Future<void> load() async {
    if (state is! HostServerState) {
      await appData.client.init();
      await startSocket();
      await startServer();
      msgs = await appData.db.getMessages();
    }
  }

  sendMessage(Message msg) async => await appData.client.sendMessage(msg);

  Future<void> startServer() async {
    var app = Router();
    app.post(RouteHandler.joinNetworkPath, (Request request) async {
      try {
        var body = await request.readAsString();
        UserData userData = UserData.fromJson(jsonDecode(body));
        if (!(state as HostServerState).users.any(
              (user) => user.uid == userData.uid,
        )) {
          final users = List<UserData>.from((state as HostServerState).users)
            ..add(userData);
          emit(HostServerState(msgs: msgs, users: users, userAdded: true));
          return Response.ok(
            jsonEncode({'Data': msgs}),
            headers: {'Content-Type': 'application/json'},
          );
        } else {
          return Response.ok(
            jsonEncode({
              'Data': msgs,
              'Msg': 'Hi ${userData.name}, you\'ve already joined group',
            }),
            headers: {'Content-Type': 'application/json'},
          );
        }
      } catch (e) {
        print(e);
      }
    });

    app.post(RouteHandler.sendMessage, (Request request) async {
      var body = await request.readAsString();
      final msg = Message.fromJson(jsonDecode(body));
      final msgs = List<Message>.from((state as HostServerState).msgs)
        ..insert(0, msg);
      await appData.db.saveMessage(msg);
      broadCastMessage(msg);
      emit(
        HostServerState(msgs: msgs, users: (state as HostServerState).users),
      );
      return Response.ok('Welcome ${msg.name}');
    });

    await io.serve(app.call, appData.client.ip, 1111);
    emit(HostServerState(msgs: msgs, users: []));
  }

  Future<void> shareApk() async {
    const platform = MethodChannel('com.harish.nearby_text/share_apk');
    try {
      final result = await platform.invokeMethod<String>('getData');
      if (result == 'Copied Successfully') {
        await SharePlus.instance.share(
          ShareParams(
            text: 'NearBy Text apk',
            files: [
              XFile('${(await getApplicationSupportDirectory())
                  .path}/backup.apk'),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> startSocket() async {
    var handler = webSocketHandler((webSocket, _) {
      webSocket.stream.listen((message) {
        clients[message] = webSocket;
      });
    });
    await io.serve(handler, appData.client.ip, 7777);
    emit(HostServerState(msgs: [], users: []));
  }

  void broadCastMessage(Message message) {
    for (var uid in clients.keys) {
      clients[uid]!.sink.add(jsonEncode(message.toJson()));
    }
  }

  Future<void> saveToDb(Message msg) async {}
}

sealed class ServerState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HostServerState extends ServerState {
  final List<Message> msgs;
  final List<UserData> users;
  final bool userAdded;

  HostServerState({
    required this.msgs,
    required this.users,
    this.userAdded = false,
  });

  @override
  List<Object?> get props => [msgs, users];
}

class LoadingServerState extends ServerState {}
