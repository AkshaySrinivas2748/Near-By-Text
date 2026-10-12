import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_text/main.dart';

import '../../../domain/models/message/message.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit() : super(InitialClientState());

  Future<void> joinNetwork(String url) async {
    await appData.client.init(url: url);
    final msgs = await appData.client.joinNetwork();
    emit(ConnectedClientState(msgs: msgs));
  }

  sendMessage(Message msg) async => await appData.client.sendMessage(msg);

  receiveMessage(Message msg) {
    final msgs = List<Message>.from((state as ConnectedClientState).msgs)
      ..insert(0, msg);
    emit(ConnectedClientState(msgs: msgs));
  }
}

sealed class ClientState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialClientState extends ClientState {}

class ConnectedClientState extends ClientState {
  final List<Message> msgs;

  ConnectedClientState({required this.msgs});

  @override
  List<Object?> get props => [msgs];
}
