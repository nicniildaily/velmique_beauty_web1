import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'core/router.dart';

void main() {
  runApp(const VelmiqueApp());
}

class VelmiqueApp extends StatelessWidget {
  const VelmiqueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Velmique Beauty',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}