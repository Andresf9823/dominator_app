import 'dart:typed_data';

import 'package:dominator_app/loggin/domain/user.dart';
import 'package:dominator_app/loggin/infrastructure/get_user_sign_in.dart';
import 'package:dominator_app/loggin/infrastructure/tcp_server.dart';

var dispenserTcpConfigurationSocket = TcpClient("192.168.0.1", 1100);

bool signIn(User user) {
  try {
    getSignInUser(user).then((userProperties) {
      if (!user.signed) {
        if (!dispenserTcpConfigurationSocket.connected) {
          dispenserTcpConfigurationSocket.connect();
        }
        final frame = [0x7B, 0x00, 0x7C, 0x01, 0x7C, 0x7D];
        // var message = Uint8List(frame.length);
        // var bytesToSend = ByteData.view(message.buffer);
        // for (int i = 0; i < frame.length; i++) {
        //   bytesToSend.setUint8(i, frame[i]);
        // }
        print("Bytes to send by TCP: $frame");
        dispenserTcpConfigurationSocket.sendMessage(frame);
      }
    });
  } catch (e) {
    //e
  }
  return user.signed;
}
