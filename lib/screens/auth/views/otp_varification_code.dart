import 'package:college_project/components/text/BodyText.dart';
import 'package:college_project/screens/auth/views/components/otp_input.dart';
import 'package:college_project/screens/auth/views/create_new_password.dart';
import 'package:college_project/view_model/resorses/Messaging/otp_generator.dart';
import 'package:college_project/view_model/resorses/Messaging/otp_mail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpVarificationCode extends StatefulWidget {
  final String email;
  final String otp;

  const OtpVarificationCode({
    super.key,
    required this.email,
    required this.otp,
  });

  @override
  State<OtpVarificationCode> createState() => _OtpVarificationCodeState();
}

class _OtpVarificationCodeState extends State<OtpVarificationCode> {
  late String _currentOtp;
  String _enteredOtp = '';
  bool isLoading = false;
  final GlobalKey<OtpInputState> otpInputKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _currentOtp = widget.otp;
  }

  void _verifyOtp() {    
    if (_enteredOtp == _currentOtp) {
      Get.off(() => CreateNewPassword(email: widget.email));
    } else {
      Get.snackbar('Error', 'Invalid OTP');
    }
  }

  Future<void> _resendOtp() async {
    final String otp = OtpGenerator().generateOTP();
    final bool isOtpSent = await OtpMail().sendOTP(widget.email, otp);

    if (isOtpSent) {
      setState(() {
        _currentOtp = otp;
        _enteredOtp = '';
      });
      otpInputKey.currentState?.clearFields();
      Get.snackbar('Success', 'New OTP sent to your email');
    } else {
      Get.snackbar('Error', 'Failed to send OTP. Please try again.');
    }
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;
    return '${parts[0].substring(0, 2)}****@${parts[1]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back, size: 25),
            ),
            const SizedBox(height: 30),
            BodyText(
              text: 'Password recovery',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  const TextSpan(text: 'We sent a verification code to '),
                  TextSpan(
                    text: _maskEmail(widget.email),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            OtpInput(
              key: otpInputKey, // Using the GlobalKey here
              length: 4,
              onCompleted: (otp) {
                _enteredOtp = otp;
                _verifyOtp();
              },
              onChanged: (value) {
                _enteredOtp = value;
              },
              decoration: InputDecoration(
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isLoading ? null : _verifyOtp,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Verify'),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: isLoading ? null : _resendOtp,
                child: const Text("Didn't receive code? Resend"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}