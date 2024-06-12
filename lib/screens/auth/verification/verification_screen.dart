import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/auth/verification/widget/password_input.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Kodni kiriting",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            color: AppColors.c010A27,
            fontSize: 20.sp,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            AppImages.arrowBackSvg,
            width: 24.we,
            height: 24.we,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: Column(
                children: [
                  4.getH(),
                  Text(
                    "Elektron pochtangizni tasdiqlash uchun biz unga kod yubordik",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.seoulRobotoRegular.copyWith(
                      color: AppColors.c010A27.withOpacity(0.40),
                      fontSize: 16.sp,
                    ),
                  ),
                  20.getH(),
                  PasswordMyInput(
                    pinController: _pinController,
                    focusNode: _focusNode,
                  ),
                ],
              ),
            ),
          ),
          GlobalMyButton(
            onTab: () {},
            title: "Davom etish",
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
