import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppState {
  final AppLifecycleState? appLifecycleState;
  final bool? isAuthenticated;
  final bool? isLoading;

  AppState({
    this.appLifecycleState,
    this.isAuthenticated,
    this.isLoading,
  });

  AppState copyWith({
    AppLifecycleState? appLifecycleState,
    bool? isAuthenticated,
    bool? isLoading,
  }) {
    return AppState(
      appLifecycleState: appLifecycleState ?? this.appLifecycleState,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AppProvider extends StateNotifier<AppState> {
  AppProvider() : super(AppState());

  void didChangeAppLifecycleState(AppLifecycleState appState) {
    state = state.copyWith(appLifecycleState: appState);
  }

  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}

final appProvider = StateNotifierProvider<AppProvider, AppState>((ref) {
  return AppProvider();
});
