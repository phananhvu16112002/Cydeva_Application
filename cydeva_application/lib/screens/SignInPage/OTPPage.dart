import 'dart:async';

import 'package:cydeva_application/screens/SignInPage/SuccessPage.dart';
import 'package:cydeva_application/common/Colors/AppColors.dart';
import 'package:cydeva_application/common/bases/CustomButton.dart';
import 'package:cydeva_application/common/bases/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String description =
      'Enter the verification code we just sent on your email address.';

  OtpFieldController otpFieldController = OtpFieldController();
  int secondsRemaining = 59; // Initial value for 1 minute
  int minutesRemaining = 2;
  bool canResend = false;
  late Timer _timer;

  // void startTimer() {
  //   _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
  //     if (secondsRemaining > 0) {
  //       setState(() {
  //         secondsRemaining--;
  //       });
  //     } else {
  //       setState(() {
  //         canResend = true;
  //       });
  //       timer.cancel();
  //     }
  //   });
  // }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (minutesRemaining == 0 && secondsRemaining == 0) {
        setState(() {
          canResend = true;
        });
        timer.cancel();
      } else if (secondsRemaining == 0) {
        setState(() {
          minutesRemaining--;
          secondsRemaining = 59;
        });
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  void restartTimer() {
    setState(() {
      secondsRemaining = 59;
      minutesRemaining = 2;
      canResend = false;
    });
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                appBar(),
                const SizedBox(
                  height: 56,
                ),
                const CustomText(
                    message: 'OTP Verification',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutral09),
                const SizedBox(
                  height: 16,
                ),
                CustomText(
                    message: description,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.neutral07),
                const SizedBox(
                  height: 56,
                ),
                OTPTextField(
                  controller: otpFieldController,
                  textFieldAlignment: MainAxisAlignment.spaceEvenly,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  length: 6,
                  width: MediaQuery.of(context).size.width,
                  otpFieldStyle: OtpFieldStyle(
                      borderColor: AppColors.neutral06,
                      enabledBorderColor: AppColors.primary3),
                  outlineBorderRadius: 8,
                  keyboardType: TextInputType.phone,
                  fieldWidth: 50,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary3),
                  fieldStyle: FieldStyle.box,
                  onChanged: (pin) {},
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Resend the code after 0$minutesRemaining:${secondsRemaining}0')
                  ],
                ),
                const SizedBox(height: 16),
                Center(
                  child: CustomButton(
                      buttonName: 'Verify',
                      backgroundColorButton: AppColors.primary3,
                      borderColor: Colors.transparent,
                      textColor: Colors.white,
                      function: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const SuccessPage()));
                      },
                      height: 52,
                      width: 342,
                      fontSize: 16,
                      colorShadow: Colors.transparent),
                ),
                const SizedBox(
                  height: 321,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                        message: "Didn't recived code ? ",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryText),
                    InkWell(
                      onTap: () {
                        restartTimer();
                      },
                      child: const CustomText(
                          message: "Resend ",
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary3),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      width: 342,
      height: 32,
      color: AppColors.backGroundColor,
      child: const Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: AppColors.gray,
          ),
          SizedBox(width: 5), // Add some space between the icon and text
          Text('Back')
        ],
      ),
    );
  }

  Widget cusTomText(
      String message, double fontSize, FontWeight fontWeight, Color color) {
    return Text(message,
        // overflow: TextOverflow.ellipsis,
        maxLines: null,
        style: GoogleFonts.inter(
            fontSize: fontSize, fontWeight: fontWeight, color: color));
  }
}
