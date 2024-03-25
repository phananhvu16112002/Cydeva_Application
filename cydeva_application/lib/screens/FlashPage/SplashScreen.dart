import 'package:cydeva_application/screens/SignInPage/Welcome.dart';
import 'package:cydeva_application/common/Colors/AppColors.dart';
import 'package:cydeva_application/common/bases/CustomText.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (builder) => const WelcomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Splash.png'),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                  message: 'Loading...',
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary3)
            ],
          )),
    );
  }
}
