import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_provider.dart';

abstract class BaseNotifier<T> extends StateNotifier<T> {
  BaseNotifier(this.ref, T state) : super(state);
  final Ref ref;

  late final _appState = ref.watch(appProvider.notifier);

  void setLoading(bool isLoading) {
    _appState.setLoading(isLoading);
  }
}
