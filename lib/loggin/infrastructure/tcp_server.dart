import 'dart:async';
import 'dart:io';

class TcpClient {
  String serverAddress;
  int port;
  late Socket socket;
  late bool connected;

  TcpClient(this.serverAddress, this.port) {
    connected = false;
  }

  void connect() async {
    try {
      Socket.connect(serverAddress, port).then((Socket sock) {
        socket = sock;
        socket.listen(_dataHandler,
            onError: _onErrorHandler, onDone: disconnect, cancelOnError: false);
        print("Connected to: $serverAddress:$port");
      });
    } catch (e) {
      print("Error connecting to server $serverAddress:$port, error: $e");
    }
  }

  void _dataHandler(data) {
    print(String.fromCharCodes(data).trim());
  }

  void _onErrorHandler(error, StackTrace trace) {
    print(error);
  }

  void sendMessage(Object message) {
    socket.write(message);
    print('Sent to server: $message');
  }

  void disconnect() {
    socket.flush();
    socket.destroy();
    socket.close();
    print("Dosconnected from $serverAddress:$port");
  }
}
