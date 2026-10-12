import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_text/main.dart';
import 'package:nearby_text/src/domain/models/message/message.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(LoadingChatState());

  Future<void> loadChatList() async {
    emit(LoadingChatState());
    if (state is! ChatLoadedState) {
      emit(ChatLoadedState(messages: []));
    }
  }

  Future<void> loadChat(DateTime date) async {
    final msgs = await appData.db.getMessages(date: date);
    emit(ChatLoadedState(messages: msgs));
  }
}

sealed class ChatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingChatState extends ChatState {}

class ChatLoadedState extends ChatState {
  final List<Message> messages;
  ChatLoadedState({required this.messages});
  @override
  List<Object?> get props => [messages];
}
