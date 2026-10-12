import 'package:nearby_text/src/domain/models/message/message.dart';
import 'package:nearby_text/src/utils/extensions/date_time_extensions.dart';

extension DBMapper on Message {
  Map<String, dynamic> get toDB => {
    "client_id": clientUID,
    "content": content,
    "dateTime": dateTime.toString(),
    "date": dateTime.dateForDB,
    "uid": dateTime.uidForDB,
    "message_type": msgType,
    "name": name,
  };
}
