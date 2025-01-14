import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social/app/base_notifier.dart';
import 'package:social/features/home/presentation/home_state.dart';
import 'package:social/services/socket.io.dart';

@riverpod
HomeViewModel homeViewModel(Ref ref) {
  return HomeViewModel(ref);
}

class HomeViewModel extends BaseNotifier {
  HomeViewModel(Ref ref) : super(ref, HomeState());
  final SocketServices socket = SocketServices.instance;
}
