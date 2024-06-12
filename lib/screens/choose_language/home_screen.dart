import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tilni tanlang",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            fontSize: 20.sp,
            color: AppColors.c010A27,
          ),
        ),
      ),
    );
  }
}
