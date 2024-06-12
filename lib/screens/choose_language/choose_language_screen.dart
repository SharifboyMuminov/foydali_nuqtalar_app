import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foydali_nuqtalar/screens/choose_language/widget/language_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key});

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Tilni tanlang",
          style: AppTextStyle.seoulRobotoRegular.copyWith(
            fontSize: 20.sp,
            color: AppColors.c010A27,
          ),
        ),
      ),
      body: Column(
        children: [
          LanguageMyButton(
            onTab: () {
              activeIndex = 0;
              setState(() {});
            },
            title: 'O‘zbek tili',
            iconPath: AppImages.uzbFlagSvg,
            active: activeIndex == 0,
          ),
          LanguageMyButton(
            onTab: () {
              activeIndex = 1;
              setState(() {});
            },
            title: 'Русский',
            iconPath: AppImages.russiaFlagSvg,
            active: activeIndex == 1,
          ),
          LanguageMyButton(
            onTab: () {
              activeIndex = 2;
              setState(() {});
            },
            title: 'English',
            iconPath: AppImages.americaFlagSvg,
            active: activeIndex == 2,
          ),
          LanguageMyButton(
            onTab: () {
              activeIndex = 3;
              setState(() {});
            },
            title: 'Français',
            iconPath: AppImages.franceFlagSvg,
            active: activeIndex == 3,
          ),
        ],
      ),
    );
  }
}
