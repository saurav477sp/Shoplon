import 'package:college_project/components/show_snackbar.dart';
import 'package:college_project/screens/auth/views/otp_varification_code.dart';
import 'package:college_project/view_model/resorses/Messaging/otp_generator.dart';
import 'package:college_project/view_model/resorses/Messaging/otp_mail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:college_project/constants.dart';

class PasswordRecoveryScreen extends StatefulWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  State<PasswordRecoveryScreen> createState() => _PasswordRecoveryScreenState();
}

class _PasswordRecoveryScreenState extends State<PasswordRecoveryScreen> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _otpGenerate() async {
    if (!_formKey.currentState!.validate()) return;

    // validate email in realtimedatabase
    

    final String otp = OtpGenerator().generateOTP();
    final bool isOtpSent = await OtpMail().sendOTP(
      _emailController.text.trim(),
      otp,
    );

    if (isOtpSent) {
      Get.to(
        () =>
            OtpVarificationCode(email: _emailController.text.trim(), otp: otp),
      );
    } else {
      ShowSnackbar.showSnackbar(
        title: 'Error',
        message: 'Failed to send OTP. Please try again.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back, size: 25),
                  color: blackColor,
                ),
                const SizedBox(height: 30),
                Text(
                  'Password recovery',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Enter your E-mail address to recover your password',
                  style: TextStyle(fontSize: 16, color: blackColor60),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: _emailController,
                  validator: emaildValidator.call,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Email address",
                    hintStyle: TextStyle(color: blackColor40),
                    errorStyle: TextStyle(color: errorColor),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding * 0.75,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Message.svg",
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          blackColor40,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: whiteColor,
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _otpGenerate,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          defaultBorderRadious,
                        ),
                      ),
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
