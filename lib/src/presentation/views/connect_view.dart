import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby_text/src/domain/repositories/app_data.dart';
import 'package:nearby_text/src/presentation/cubits/client/client_cubit.dart';
import 'package:nearby_text/src/presentation/widgets/qr_scanner.dart';

// import 'MobileScannerSimple.dart';

class ClientView extends StatelessWidget {
  const ClientView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ClientCubit>(
      create: (context) => getIt<ClientCubit>(),
      child: QRViewExample(),
    );
  }
}
