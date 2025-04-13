import 'package:cash_trace/app/contants/common_enums.dart';
import 'package:cash_trace/app/providers/auth_provider.dart';
import 'package:cash_trace/app/screens/addTransactions/view/add_transaction_screen.dart';
import 'package:cash_trace/app/screens/auth/views/login_screen.dart';
import 'package:cash_trace/app/screens/dash/views/dash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      // If still determining auth state, don't redirect
      if (authState == AuthStates.initial) {
        return null;
      }

      // If authenticated and trying to access login, redirect to dash
      if (authState == AuthStates.authenticated && state.uri.path == '/') {
        return '/dash';
      }

      // If not authenticated and trying to access protected routes, redirect to login
      if (authState == AuthStates.unauthenticated && state.uri.path != '/') {
        return '/';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
          name: 'dash',
          path: '/dash',
          builder: (context, state) => const DashScreen(),
          routes: [
            GoRoute(
              name: "add",
              path: '/add',
              builder: (context, state) => AddTransactionScreen(),
            )
          ]),
    ],
  );
});
