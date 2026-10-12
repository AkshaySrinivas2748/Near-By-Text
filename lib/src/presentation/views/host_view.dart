import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_text/main.dart';
import 'package:nearby_text/src/config/router.dart';
import 'package:nearby_text/src/domain/repositories/app_data.dart';
import 'package:nearby_text/src/presentation/cubits/server/server_cubit.dart';
import 'package:nearby_text/src/presentation/widgets/gradient_container.dart';
import 'package:nearby_text/src/utils/extensions/double_extension.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HostView extends StatelessWidget {
  const HostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ServerCubit>()..load(),
        child: BlocConsumer<ServerCubit, ServerState>(
          listener: (context, state) {
            if (state is HostServerState && state.userAdded) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('New Client Joined')));
            }
          },
          builder: (context, state) {
            switch (state) {
              case HostServerState():
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: QrImageView(
                          padding: const EdgeInsets.all(20),
                          data: appData.client.ip,
                          backgroundColor: Theme.of(context).cardColor,
                          dataModuleStyle: QrDataModuleStyle(
                            color: Colors.white,
                            // dataModuleShape: QrDataModuleShape.square,
                          ),
                          eyeStyle: QrEyeStyle(
                            color: Colors.white,
                            eyeShape: QrEyeShape.circle,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.users.length,
                        itemBuilder: (context, index) {
                          return GradientContainer(
                            child: Row(
                              children: [
                                Icon(Icons.person, color: Colors.white),
                                Text(
                                  state.users[index].name,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ); //state.users[index].name);
                        },
                      ),
                    ),
                    // Text(appData.client.ip),
                    20.0.height,
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.chatAsHost);
                      },
                      child: Text("Chat Now"),
                    ),
                    20.0.height,
                  ],
                );
              case LoadingServerState():
                return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
