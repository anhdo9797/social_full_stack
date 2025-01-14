import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social/constant/api.dart';
import 'package:social/data/local/storage.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final socketProvider = Provider<SocketServices>((ref) {
  return SocketServices._instance;
});

class SocketServices {
  late final IO.Socket socket;

  static final SocketServices _instance = SocketServices._internal();
  static SocketServices get instance => _instance;

  SocketServices._internal() {
    final token = Storage.token;
    if (token.isEmpty) {
      log('User not connected', name: 'socket.io');
      return;
    }

    socket = IO.io(
      BASE_URL,
      IO.OptionBuilder()
          .setTransports(["websocket"])
          .disableAutoConnect()
          .setAuth({
            'token': token,
          })
          .setTimeout(20000)
          .enableForceNewConnection()
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      log('user connected success', name: 'socket.io');
    });
    socket.onConnectError(
      (data) => log(
        'user connect failed with message: $data',
        name: 'socket.io',
      ),
    );
    socket.onDisconnect((_) => log('user disconnected', name: 'socket.io'));
  }
}
