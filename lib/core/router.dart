import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/download_page.dart';
import '../pages/privacy_policy_page.dart';
import '../pages/terms_of_use_page.dart';
import '../pages/contact_page.dart';
import '../components/shell_scaffold.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ShellScaffold(child: child),
        routes: [
          GoRoute(
            path: '/',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const HomePage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          ),
          GoRoute(
            path: '/download',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const DownloadPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          ),
          GoRoute(
            path: '/privacy-policy',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const PrivacyPolicyPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          ),
          GoRoute(
            path: '/terms-of-use',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const TermsOfUsePage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          ),
          GoRoute(
            path: '/contact',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const ContactPage(),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          ),
        ],
      ),
    ],
  );
}