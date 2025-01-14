import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social/data/local/storage.dart';
import 'package:social/features/auth/presentation/auth_screen.dart';
import 'package:social/features/home/presentation/home_screen.dart';

// class AppRoutes {
//   static final GoRouter router = GoRouter(
//     initialLocation: '/auth',
//     routes: <RouteBase>[
//       GoRoute(
//         path: '/auth',
//         builder: (BuildContext context, GoRouterState state) {
//           return AuthScreen();
//         },
//       ),
//       GoRoute(
//         path: '/',
//         builder: (BuildContext context, GoRouterState state) {
//           return const HomeScreen();
//         },
//       ),
//     ],
//   );
// }

part 'app_routes.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/auth',
    redirect: (context, state) {
      if (Storage.token.isEmpty) {
        return '/auth';
      }
      return '/';
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/auth',
        builder: (BuildContext context, GoRouterState state) {
          return AuthScreen();
        },
      ),
      GoRoute(
        path: '/',
        name: "Home",
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
      ),
    ],
  );
}
