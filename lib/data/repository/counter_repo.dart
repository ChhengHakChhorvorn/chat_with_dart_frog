
import 'package:web_socket_client/web_socket_client.dart';

/// A Dart package which manages the counter domain.
class CounterRepository {
  CounterRepository({WebSocket? socket})
      : _ws = socket ?? WebSocket(Uri.parse('ws://192.168.103.33:8080/ws'));

  final WebSocket _ws;

  /// Send an increment message to the server.
  void increment() => _ws.send('increment');

  /// Send a decrement message to the server.
  void decrement() => _ws.send('decrement');

  Stream<dynamic> get getMessage => _ws.messages;

  /// Close the connection.
  void close() => _ws.close();
}
