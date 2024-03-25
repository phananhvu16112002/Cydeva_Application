import 'package:cydeva_application/screens/SignInPage/OTPPage.dart';
import 'package:cydeva_application/common/Colors/AppColors.dart';
import 'package:cydeva_application/common/bases/CustomButton.dart';
import 'package:cydeva_application/common/bases/CustomText.dart';
import 'package:cydeva_application/common/bases/CustomTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String title = 'Welcome Back! Glad to see you, Again!';
  TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                cusTomText(title, 32, FontWeight.w700, AppColors.primaryText),
                const SizedBox(
                  height: 16,
                ),
                const CustomText(
                    message: 'Enter your phone number',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryText),
                const SizedBox(
                  height: 4,
                ),
                CustomTextField(
                  controller: phoneNumberController,
                  textInputType: TextInputType.phone,
                  obscureText: false,
                  suffixIcon:
                      const IconButton(onPressed: null, icon: Icon(null)),
                  hintText: 'Phone Number',
                  prefixIcon: const Icon(null),
                  readOnly: false,
                  width: double.infinity,
                  height: 56,
                  colorHintText: AppColors.neutral05,
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomButton(
                    buttonName: 'Login',
                    backgroundColorButton: AppColors.primaryButton,
                    borderColor: Colors.white,
                    textColor: Colors.white,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const OTPPage()));
                    },
                    height: 52,
                    width: double.infinity,
                    fontSize: 16,
                    colorShadow: Colors.transparent),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.neutral04)),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    const CustomText(
                        message: 'Or Login with',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.neutral04)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: [
                    customThirdParty('facebook'),
                    const SizedBox(
                      width: 8,
                    ),
                    customThirdParty('Google'),
                    const SizedBox(
                      width: 8,
                    ),
                    customThirdParty('apple'),
                  ],
                ),
                const SizedBox(
                  height: 234,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                        message: "Don't have an account? ",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondaryText),
                    InkWell(
                      onTap: () {},
                      child: const CustomText(
                          message: 'Register Now',
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryButton),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget customThirdParty(String imageName) {
    return Expanded(
        child: Container(
      height: 56,
      width: 108.49,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor)),
      child: Center(child: SvgPicture.asset('assets/icons/$imageName.svg')),
    ));
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
