import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/screens/auth/sign_up/sing_up_screen.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class CautionScreen extends StatelessWidget {
  const CautionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
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
        shape: Border(
          bottom: BorderSide(
            color: AppColors.c010A27.withOpacity(0.08),
            width: 1.we,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.we),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "To’liq kitobni o‘qish uchun profilga kirishingiz va to'lov qilishingiz kerak",
              textAlign: TextAlign.center,
              style: AppTextStyle.seoulRobotoSemiBold.copyWith(
                color: AppColors.c010A27,
                fontSize: 20.sp,
              ),
            ),
            6.getH(),
            Text(
              "Hozirda siz kitobning dastlabki 3 bobini bepul o'qishingiz mumkin.",
              textAlign: TextAlign.center,
              style: AppTextStyle.seoulRobotoRegular.copyWith(
                color: AppColors.c010A27,
                fontSize: 14.sp,
              ),
            ),
            18.getH(),
            GlobalMyButton(
              margin: EdgeInsets.zero,
              onTab: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return const SignUpScreen();
                  },
                ), (route) => false);
              },
              title: "Profilga kirish",
            ),
          ],
        ),
      ),
    );
  }
}
