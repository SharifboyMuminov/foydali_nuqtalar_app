import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/screens/auth/forgot_password/forgot_password_screen.dart';
import 'package:foydali_nuqtalar/screens/auth/verification/verification_screen.dart';
import 'package:foydali_nuqtalar/screens/auth/widget/auth_button.dart';
import 'package:foydali_nuqtalar/screens/auth/widget/auth_input.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class LoginInScreen extends StatefulWidget {
  const LoginInScreen({super.key});

  @override
  State<LoginInScreen> createState() => _LoginInScreenState();
}

class _LoginInScreenState extends State<LoginInScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profilga kirish",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            color: AppColors.c010A27,
            fontSize: 20.sp,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.we, vertical: 16.he),
              child: Column(
                children: [
                  AuthMyButton(
                    onTab: () {},
                    title: "Google orqali kirish",
                    iconPathSvg: AppImages.googleLogoSvg,
                  ),
                  12.getH(),
                  AuthMyButton(
                    onTab: () {},
                    title: "Apple orqali kirish",
                    iconPathSvg: AppImages.appleLogoSvg,
                  ),
                  20.getH(),
                  Text(
                    "Yoki",
                    style: AppTextStyle.seoulRobotoRegular.copyWith(
                      color: AppColors.c010A27.withOpacity(0.40),
                      fontSize: 16.sp,
                    ),
                  ),
                  20.getH(),
                  AuthMyInput(
                    textInputType: TextInputType.emailAddress,
                    textEditingController: controllerEmail,
                    hintText: 'Elektron pochta',
                  ),
                  12.getH(),
                  AuthMyInput(
                    textInputAction: TextInputAction.done,
                    textEditingController: controllerPassword,
                    hintText: 'Parol',
                    isPasswordInput: obscureText,
                    obscureText: obscureText,
                    onTabEye: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  20.getH(),
                  GlobalMyButton(
                    margin: EdgeInsets.zero,
                    onTab: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const VerificationScreen();
                          },
                        ),
                      );
                    },
                    title: "Ro‘yxatdan o‘tish",
                  ),
                  20.getH(),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 5.we),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ForgotPasswordScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Parolni unutdingizmi?",
                      style: AppTextStyle.seoulRobotoRegular.copyWith(
                        color: AppColors.cF07448,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 30.he,
              left: 20.we,
              right: 20.we,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Profilngiz yo’qmi?",
                  style: AppTextStyle.seoulRobotoRegular.copyWith(
                    color: AppColors.c010A27,
                    fontSize: 16.sp,
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 4.we),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Ro‘yxatdan o‘tish",
                    style: AppTextStyle.seoulRobotoRegular.copyWith(
                      color: AppColors.cF07448,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controllerPassword.dispose();
    controllerEmail.dispose();
    super.dispose();
  }
}
