import 'package:clean_architecture_with_bloc/app/navigation/app_router_config.dart';
import 'package:flutter/material.dart';

class IMDBCloneApp extends StatefulWidget {
  const IMDBCloneApp({super.key});

  @override
  State<IMDBCloneApp> createState() => _IMDBCloneAppState();
}

class _IMDBCloneAppState extends State<IMDBCloneApp> {
  final _appRouterConfig = AppRouterConfig();

  @override
  void dispose() {
    _appRouterConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouterConfig.router,
    );
  }
}
