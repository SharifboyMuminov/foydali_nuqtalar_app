import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/screens/auth/log_in/log_in_screen.dart';
import 'package:foydali_nuqtalar/screens/auth/widget/auth_button.dart';
import 'package:foydali_nuqtalar/screens/auth/widget/auth_input.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController controllerName = TextEditingController();
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
          "Ro‘yxatdan o‘tish",
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
                    textEditingController: controllerName,
                    hintText: 'Ismingiz',
                  ),
                  12.getH(),
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
                    iconData: obscureText
                        ? Icons.remove_red_eye_outlined
                        : Icons.remove_red_eye,
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
                    onTab: () {},
                    title: "Ro‘yxatdan o‘tish",
                  ),
                  20.getH(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Profilngiz bormi?",
                        style: AppTextStyle.seoulRobotoRegular.copyWith(
                          color: AppColors.c010A27,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginInScreen();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Kirish",
                          style: AppTextStyle.seoulRobotoRegular.copyWith(
                            color: AppColors.cF07448,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
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
            child: Text(
              textAlign: TextAlign.center,
              "Ro'yxatdan o'tayotib, shaxsiy ma'lumotlarni qayta ishlash va ilovadan foydalanish shartlarini qabul qilasiz.",
              style: AppTextStyle.seoulRobotoRegular.copyWith(
                  color: AppColors.c010A27.withOpacity(0.40), fontSize: 14.sp),
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
    controllerName.dispose();
    super.dispose();
  }
}
