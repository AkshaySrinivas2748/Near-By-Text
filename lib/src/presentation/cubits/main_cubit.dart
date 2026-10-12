import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_text/src/domain/models/message/message.dart';

class MainCubit extends Cubit<List<Message>> {
  MainCubit() : super([]);

  Future<void> sendMessage(Message msg) async {}
}
