import 'package:flutter/material.dart';
import 'package:nearby_text/src/domain/repositories/app_data.dart';
import 'package:nearby_text/src/utils/theme_data.dart';
import 'src/config/router.dart';

final appData = AppData();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appData.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: MaterialApp(
            routes: AppRoutes.routes,
            initialRoute: AppRoutes.initialRoute(appData.isRegistered),
            debugShowCheckedModeBanner: false,
            title: 'NearBy Text',
            theme: lightThemeData,
            darkTheme: darkThemeData,
          ),
        ),
      ),
    );
  }
}
