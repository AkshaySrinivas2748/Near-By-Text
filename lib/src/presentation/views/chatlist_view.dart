import 'package:flutter/material.dart';
import 'package:nearby_text/main.dart';
import 'package:nearby_text/src/domain/repositories/app_data.dart';
import 'package:nearby_text/src/presentation/cubits/chat_cubit.dart';
import 'package:nearby_text/src/presentation/views/chat_view.dart';
import 'package:nearby_text/src/presentation/widgets/gradient_container.dart';
import 'package:nearby_text/src/utils/constants/enums.dart';
import 'package:nearby_text/src/utils/extensions/date_time_extensions.dart';
import 'package:nearby_text/src/utils/extensions/double_extension.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            appData.db.dates.isEmpty
                ? Center(child: Text('No Old Chats Found'))
                : ListView.builder(
                  itemCount: appData.db.dates.length,
                  itemBuilder: (context, index) {
                    return GradientContainer(
                      onTap: () async {
                        getIt<ChatCubit>().loadChat(appData.db.dates[index]);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    ChatView(state: ChatViewState.chatHistory),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 15,
                          ),
                          10.0.width,
                          Text(
                            appData.db.dates[index].ddMmmmYYYY,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          15.0.width,
                        ],
                      ),
                    );
                  },
                ),
      ),
    );
  }
}
