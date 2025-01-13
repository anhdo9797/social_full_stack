import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social/app/base_notifier.dart';
import 'package:social/features/auth/data/auth_repository.dart';

class AuthState {
  AuthState();

  AuthState copyWith() {
    return AuthState();
  }
}

class AuthViewModel extends BaseNotifier<AuthState> {
  AuthViewModel(Ref ref) : super(ref, AuthState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn() async {
    setLoading(true);
    try {
      final response = await ref.read(authRepositoryProvider).login(
            emailController.text,
            passwordController.text,
          );
      if (response.success) {
      } else {
        showError(response.message ?? '');
      }
    } catch (e) {
      log("login failed: " + e.toString(), name: "Login controller");
      showError("Log in failed");
    } finally {
      setLoading(false);
    }
  }

  Future<void> signOut() async {}
}

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(ref);
});
