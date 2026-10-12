import 'package:flutter/material.dart';
import 'package:nearby_text/src/domain/repositories/app_data.dart';
import 'package:nearby_text/src/presentation/cubits/server/server_cubit.dart';
import 'package:nearby_text/src/presentation/views/chatlist_view.dart';
import 'package:nearby_text/src/presentation/views/connect_view.dart';
import 'package:nearby_text/src/presentation/views/host_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final nameController = TextEditingController(),
      phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('NearBy Text', style: TextTheme.of(context).titleLarge),
          elevation: 10,
          toolbarHeight: 40,
          backgroundColor: Theme.of(context).cardColor,
          actions: [
            IconButton(
              onPressed: () async => await getIt<ServerCubit>().shareApk(),
              icon: Icon(Icons.share, color: Colors.white),
            ),
          ],
          bottom: TabBar(
            indicator: BoxDecoration(color: Colors.blue),
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            dividerColor: Theme.of(context).cardColor,
            tabs: [
              Tab(text: 'Host'),
              Tab(text: 'Client'),
              Tab(text: 'Old Chats'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [HostView(), ClientView(), ChatListView()],
        ),
      ),
    );
  }
}
