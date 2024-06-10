import 'package:dominator_app/loggin/domain/user.dart';
import 'package:dominator_app/loggin/infrastructure/get_user_sign_in.dart';
// import 'package:dominator_app/loggin/infrastructure/tcp_server.dart';

bool signIn(User user) {
  try {
    // var dispenserTcpConfigurationSocket = TcpClient("localhost", 1100);
    getSignInUser(user).then((userProperties) {
      // if (!user.signed) {
      //   if (!dispenserTcpConfigurationSocket.connected) {
      //     dispenserTcpConfigurationSocket.connect();
      //   }
      //   final frame = [0x7B, 0x00, 0x7C, 0x01, 0x7C, 0x7D];
      //   // var message = Uint8List(frame.length);
      //   // var bytesToSend = ByteData.view(message.buffer);
      //   // for (int i = 0; i < frame.length; i++) {
      //   //   bytesToSend.setUint8(i, frame[i]);
      //   // }
      //   print("Bytes to send by TCP: $frame");
      //   dispenserTcpConfigurationSocket.sendMessage(frame);
      // }
    });
  } catch (e) {
    //e
  }
  return user.signed;
}
