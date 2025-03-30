import 'package:college_project/components/show_snackbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class OtpMail {
  Future<bool> sendOTP(String email, String otp) async {
    try {
      final smtpServer = gmail(
        dotenv.env['GMAIL_EMAIL'] ?? '',
        dotenv.env['GMAIL_PASSWORD'] ?? '',
      );

      print(dotenv.env['GMAIL_EMAIL']);
      print(dotenv.env['GMAIL_PASSWORD']);

      final message =
          Message()
            ..from = Address(dotenv.env['GMAIL_EMAIL']!, 'shoploan')
            ..recipients.add(email)
            ..subject = 'OTP for Project'
            ..text = 'Your OTP is $otp';

      await send(message, smtpServer);
      return true;
    } on MailerException catch (e) {
      print('MailerException: ${e.message}');
      ShowSnackbar.showSnackbar(
        title: 'problem',
        message: 'fail to send an email',
      );
      return false;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
