import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social/app/base_notifier.dart';

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
    await Future.delayed(const Duration(seconds: 2));
    setLoading(false);
  }

  Future<void> signOut() async {}
}

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(ref);
});
