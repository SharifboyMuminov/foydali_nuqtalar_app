import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foydali_nuqtalar/data/local/storage_repository.dart';
import 'package:foydali_nuqtalar/screens/choose_language/widget/language_button.dart';
import 'package:foydali_nuqtalar/screens/instruction_video/instruction_video_screen.dart';
import 'package:foydali_nuqtalar/screens/widget/global_button.dart';
import 'package:foydali_nuqtalar/utils/app_colors.dart';
import 'package:foydali_nuqtalar/utils/app_images.dart';
import 'package:foydali_nuqtalar/utils/app_size.dart';
import 'package:foydali_nuqtalar/utils/app_text_style.dart';

class ChooseLanguageScreen extends StatefulWidget {
  const ChooseLanguageScreen({super.key, this.isSetLanguage = false});

  final bool isSetLanguage;

  @override
  State<ChooseLanguageScreen> createState() => _ChooseLanguageScreenState();
}

class _ChooseLanguageScreenState extends State<ChooseLanguageScreen> {
  int activeIndex = 0;

  @override
  void initState() {
    if (widget.isSetLanguage) {
      activeIndex = StorageRepository.getInt(key: "active_language");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tilni tanlang",
        ),
        leading: widget.isSetLanguage
            ? IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  AppImages.arrowBackSvg,
                  width: 24.we,
                  height: 24.we,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).colorScheme.secondary,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,
      ),
      body: Column(
        children: [
          LanguageMyButton(
            onTab: () {
              activeIndex = 0;
              StorageRepository.setInt(key: "active_language", value: 0);

              setState(() {});
            },
            title: 'O‘zbek tili',
            iconPath: AppImages.uzbFlagSvg,
            active: activeIndex == 0,
          ),
          LanguageMyButton(
            onTab: () {
              activeIndex = 1;
              StorageRepository.setInt(key: "active_language", value: 1);

              setState(() {});
            },
            title: 'Русский',
            iconPath: AppImages.russiaFlagSvg,
            active: activeIndex == 1,
          ),
          LanguageMyButton(
            onTab: () {
              activeIndex = 2;
              StorageRepository.setInt(key: "active_language", value: 2);

              setState(() {});
            },
            title: 'English',
            iconPath: AppImages.americaFlagSvg,
            active: activeIndex == 2,
          ),
          LanguageMyButton(
            onTab: () {
              activeIndex = 3;
              StorageRepository.setInt(key: "active_language", value: 3);
              setState(() {});
            },
            title: 'Français',
            iconPath: AppImages.franceFlagSvg,
            active: activeIndex == 3,
          ),
          const Spacer(),
          if (!widget.isSetLanguage)
            GlobalMyButton(
              onTab: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const InstructionVideoScreen();
                    },
                  ),
                );
              },
              title: 'Davom etish',
            ),
        ],
      ),
    );
  }
}
