import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_provider.dart';

abstract class BaseNotifier<T> extends StateNotifier<T> {
  BaseNotifier(this.ref, T state) : super(state);
  final Ref ref;

  late final _appState = ref.watch(appProvider.notifier);

  void setLoading(bool isLoading) {
    _appState.setLoading(isLoading);
  }

  void showError(String message) {
    final context = _appState.navigationKey.currentContext;
    final colorScheme = Theme.of(context!).colorScheme;

    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: colorScheme.onError),
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: colorScheme.error,
    );

    _appState.scaffoldMessengerState.currentState
        ?.showSnackBar(snackBar)
        .closed
        .then((reason) {
      if (reason == SnackBarClosedReason.timeout) {
        print('SnackBar is closed by timeout');
      }
    });
  }
}
