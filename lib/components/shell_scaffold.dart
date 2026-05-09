import 'package:flutter/material.dart';
import '../core/theme.dart';
import 'header.dart';
import 'footer.dart';

class ShellScaffold extends StatelessWidget {
  final Widget child;
  
  const ShellScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const AppHeader(),
          Expanded(
            child: Container(
              width: double.infinity,
              child: child,
            ),
          ),
          const AppFooter(),
        ],
      ),
    );
  }
}