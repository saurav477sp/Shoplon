import 'dart:math';

class OtpGenerator {
  String? otp;
  String generateOTP() {
    Random random = Random();
    otp = (1000 + random.nextInt(9000)).toString();
    return otp!;
  }

  bool varifyOTP(String otp) {
    if (this.otp == otp) {
      return true;
    } else {
      return false;
    }
  }
}
