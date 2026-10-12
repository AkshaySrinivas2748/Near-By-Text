import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_text/main.dart';
import 'package:nearby_text/src/domain/models/message/message.dart';
import 'package:nearby_text/src/domain/repositories/app_data.dart';
import 'package:nearby_text/src/presentation/cubits/chat_cubit.dart';
import 'package:nearby_text/src/presentation/cubits/client/client_cubit.dart';
import 'package:nearby_text/src/presentation/cubits/server/server_cubit.dart';
import 'package:nearby_text/src/utils/constants/enums.dart';
import 'package:nearby_text/src/utils/extensions/date_time_extensions.dart';

final colors = [
  Color(0xFF4285f4),
  Color(0xFFEA4335),
  Color(0xFFFBBC05),
  Color(0xFF34A853),
  Color(0xFF673AB7),
];
final indexes = List.generate(100, (e) => e);

class ChatView extends StatelessWidget {
  final ChatViewState state;

  const ChatView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.white),
          elevation: 10,
          toolbarHeight: 40,
          backgroundColor: Theme.of(context).cardColor,
          title: Text('Group Chat', style: TextTheme.of(context).titleLarge),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<ServerCubit>(
              create: (context) => getIt<ServerCubit>(),
            ),
            BlocProvider<ClientCubit>(
              create: (context) => getIt<ClientCubit>(),
            ),
            BlocProvider<ChatCubit>(create: (context) => getIt<ChatCubit>()),
          ],
          child: Column(
            children: [
              Expanded(
                child: switch (state) {
                  ChatViewState.host => BlocBuilder<ServerCubit, ServerState>(
                    builder: (context, state) {
                      switch (state) {
                        case HostServerState():
                          return ListView.builder(
                            reverse: true,
                            itemCount: state.msgs.length,
                            itemBuilder: (context, index) {
                              return ChatTile(message: state.msgs[index]);
                            },
                          );
                        case LoadingServerState():
                          return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                  ChatViewState.client => BlocBuilder<ClientCubit, ClientState>(
                    builder: (context, state) {
                      switch (state) {
                        case InitialClientState():
                          return Center(child: CircularProgressIndicator());
                        case ConnectedClientState():
                          return ListView.builder(
                            reverse: true,
                            itemCount: state.msgs.length,
                            itemBuilder: (context, index) {
                              return ChatTile(message: state.msgs[index]);
                            },
                          );
                      }
                    },
                  ),
                  ChatViewState.chatHistory =>
                    BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        switch (state) {
                          case LoadingChatState():
                            return Center(child: CircularProgressIndicator());
                          case ChatLoadedState():
                            return ListView.builder(
                              reverse: true,
                              itemCount: state.messages.length,
                              itemBuilder: (context, index) {
                                return ChatTile(
                                  message:
                                      state.messages[state.messages.length -
                                          1 -
                                          index],
                                );
                              },
                            );
                        }
                      },
                    ),
                },
              ),
              Visibility(
                visible: state != ChatViewState.chatHistory,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          style: Theme.of(context).textTheme.displaySmall,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Type here',
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          final msg = Message(
                            clientUID: appData.userData.uid,
                            content: controller.text,
                            dateTime: DateTime.now(),
                            uid: DateTime.now().toString(),
                            msgType: 'msg',
                            name: appData.userData.name,
                          );
                          if (state == ChatViewState.host) {
                            getIt<ServerCubit>().sendMessage(msg);
                          } else {
                            getIt<ClientCubit>().sendMessage(msg);
                          }
                          controller
                            ..clear()
                            ..text = '';
                        },
                        icon: Icon(Icons.send_rounded),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final Message message;

  const ChatTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      alignment:
          message.clientUID == appData.userData.uid
              ? Alignment.centerRight
              : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.7,
        ),
        child: Column(
          crossAxisAlignment:
              message.clientUID == appData.userData.uid
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 15, 5),
                color:
                    // message.clientUID != appData.userData.uid
                    Theme.of(context).cardColor,
                // colors[Random().nextInt(5)],
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${message.name} | ${message.dateTime.hhmmss}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      message.content ?? '',
                      textAlign: TextAlign.start,
                      style: TextTheme.of(context).bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width - 5, 5);
    path.lineTo(size.width - 5, size.height - 5);
    path.arcToPoint(
      Offset(size.width - 10, size.height),
      radius: Radius.circular(5),
    );
    path.lineTo(5, size.height);
    path.arcToPoint(Offset(0, size.height - 5), radius: Radius.circular(5));
    path.lineTo(0, 5);
    path.arcToPoint(Offset(5, 0), radius: Radius.circular(5));
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
