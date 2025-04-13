import 'dart:async';

import 'package:cash_trace/app/contants/common_enums.dart';
import 'package:cash_trace/app/models/responses/user_model.dart';
import 'package:cash_trace/app/repo/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@riverpod
AuthRepository authRepository(ref) {
  return AuthRepository();
}

@riverpod
class AuthState extends _$AuthState {
  StreamSubscription<UserModel?>? _authSubscription;

  @override
  AuthStates build() {
    _setupAuthStateListener();
    return AuthStates.initial;
  }

  UserModel? user;

  void _setupAuthStateListener() {
    final authRepo = ref.read(authRepositoryProvider);
    _authSubscription?.cancel();
    _authSubscription = authRepo.authStateChanges.listen((userModel) {
      user = userModel;
      state = userModel != null
          ? AuthStates.authenticated
          : AuthStates.unauthenticated;
    });
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    // super.dispose();
  }

  Future<void> signInWithGoogle() async {
    state = AuthStates.loading;
    try {
      final authRepo = ref.read(authRepositoryProvider);
      user = await authRepo.signInWithGoogle();
      if (user != null) {
        state = AuthStates.authenticated;
      } else {
        state = AuthStates.unauthenticated;
      }
    } catch (e) {
      print('Error in signInWithGoogle: $e');
      state = AuthStates.error;
    }
  }

  Future<void> signOut() async {
    state = AuthStates.loading;
    try {
      final authRepo = ref.read(authRepositoryProvider);
      await authRepo.signOut();
      user = null;
      state = AuthStates.unauthenticated;
    } catch (e) {
      print('Error in signOut: $e');
      state = AuthStates.error;
    }
  }
}

@riverpod
UserModel? user(UserRef ref) {
  final authState = ref.watch(authStateProvider);
  final authStateNotifier = ref.watch(authStateProvider.notifier);

  // Return user only when authenticated
  if (authState == AuthStates.authenticated) {
    return authStateNotifier.user;
  }
  return null;
}
