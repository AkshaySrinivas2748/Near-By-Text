import 'dart:io';

import 'package:nearby_text/src/domain/models/message/message.dart';
import 'package:nearby_text/src/utils/extensions/date_time_extensions.dart';
import 'package:nearby_text/src/utils/extensions/message_extension.dart';
import 'package:nearby_text/src/utils/extensions/string_extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const _version = 1;
const msgTable = "message";

class DatabaseHelper {
  late Database _db;
  late List<DateTime> dates;

  Future<void> init() async {
    Directory path = await getApplicationDocumentsDirectory();
    _db = await openDatabase(
      "${path.path}/nearby_text.db",
      version: _version,
      onCreate: (db, version) async {
        final batch = db.batch();
        batch.execute(messageTableCreationQuery);
        await batch.commit();
      },
    );
    await getDates();
  }

  Future<List<Message>> getMessages({DateTime? date}) async {
    List<dynamic> data = await _db.query(
      msgTable,
      where: 'date = ?',
      whereArgs: [(date ?? DateTime.now()).dateForDB],
    );

    return data
        .map(
          (rawMsg) => Message(
            clientUID: rawMsg['client_id'],
            content: rawMsg['content'],
            dateTime: DateTime.parse(rawMsg['dateTime']),
            uid: rawMsg['dateTime'],
            msgType: rawMsg['message_type'],
            name: rawMsg['name'],
          ),
        )
        .toList()
        .reversed
        .toList();
  }

  Future<bool> saveMessage(Message message) async {
    try {
      int result = await _db.insert(msgTable, message.toDB);
      return result == 0;
    } catch (e) {
      return false;
    }
  }

  Future<void> getDates() async {
    List<dynamic> data = await _db.rawQuery(chatList);
    final rawDates = data.map((element) => (element['date'] as int)).toList();
    rawDates.sort();
    dates = rawDates.map((e) => e.toString().toDate!).toList();
  }

  final messageTableCreationQuery = '''CREATE TABLE "$msgTable" (
	"client_id"	TEXT NOT NULL,
	"content"	TEXT,
	"dateTime"	INTEGER NOT NULL,
	"date"	INTEGER NOT NULL,
	"uid"	TEXT NOT NULL,
	"message_type"	TEXT NOT NULL,
	"name"	TEXT
)''';
  final chatList = '''SELECT DISTINCT date FROM message''';

  String msgQuery(DateTime? date) =>
      '''SELECT * FROM message WHERE message.date == ${date ?? DateTime.now().dateForDB}''';
}

// SELECT message.*, clients.name,clients.phone_no FROM clients JOIN message WHERE message.client_id=clients.uid
