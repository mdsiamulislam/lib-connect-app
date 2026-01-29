import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:libconnect/core/theme/app_theme.dart';

import 'core/route/routing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const LibConnect());
}

class LibConnect extends StatelessWidget {
  const LibConnect({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Lib Connect',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: Routing.router,
    );
  }
}
