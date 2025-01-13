import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:social/features/auth/presentation/auth_screen.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
    initialLocation: '/auth',
    routes: <RouteBase>[
      // GoRoute(
      //   path: '/',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const HomeScreen();
      //   },
      // ),
      GoRoute(
        path: '/auth',
        builder: (BuildContext context, GoRouterState state) {
          return AuthScreen();
        },
      ),
      // GoRoute(
      //   path: '/profile',
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const ProfileScreen();
      //   },
      // ),
    ],
  );
}
